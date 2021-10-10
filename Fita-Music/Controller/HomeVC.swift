//
//  ViewController.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import UIKit
import Combine
import Kingfisher
import AVFoundation
class HomeVC: UIViewController{
    let playImg = UIImage(named: "play")
    let pauseImg = UIImage(named: "pause")
    var subscriptions: Set<AnyCancellable> = []
    let searchController = UISearchController()
    var musicAPI: MusicAPI = MusicAPIImpl.instance
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var seeker: UISlider!
    @IBOutlet weak var nowPlayingImgView: UIImageView!
    var player: AVPlayer? = nil
    @IBOutlet weak var playButtonImg: UIImageView!
    var isPlaying = false{
        didSet{
            if isPlaying{
                playerView.isHidden = false
                playButtonImg.image = pauseImg
                if let player = player{
                    player.play()
                }
            } else {
                playButtonImg.image = playImg
                if let player = player{
                    player.pause()
                }
            }
        }
    }
    @Published var searchText: String = String()
    var tracks: [TrackModel] = []{
        didSet{
            DispatchQueue.main.async{self.tableView.reloadData()}
        }
    }
    var nowPlayingIndex: Int? = 0
    var nowPlaying: TrackModel? = nil{
        didSet{
            if let nowPlaying = nowPlaying, let url = URL(string: nowPlaying.previewUrl) {
                titleLabel.text = nowPlaying.trackName
                artistLabel.text = nowPlaying.artistName
                self.play(url: url)
                if let url = URL(string: nowPlaying.artworkUrl60){
                    self.nowPlayingImgView.kf.setImage(with: url)
                }
            } else {
                playerView.isHidden = true
                self.stop()
                nowPlayingImgView.image = nil
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.isHidden = true
        tableView.register(UINib(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: MusicCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        nowPlayingImgView.layer.borderColor = UIColor.black.cgColor
        nowPlayingImgView.layer.borderWidth = 1
        $searchText.debounce(for: .milliseconds(500), scheduler: RunLoop.main).sink(receiveValue: { value in
            self.apiCall()
        }).store(in: &subscriptions)
        seeker.addTarget(self, action: #selector(seek), for: .valueChanged)
    }
    @objc func seek(){
        if let player = player, let duration = player.currentItem?.duration{
            let durationSecs = CMTimeGetSeconds(duration)
            let seekDuration = Double(seeker.value) * durationSecs
            player.seek(to: CMTime(value: Int64(seekDuration), timescale: 1))
        }
    }
    func apiCall(){
        musicAPI.searchByQuery(query: searchText) { res in
            switch res{
            case let .success(response):
                debugPrint(response)
                var tracks = response.results.filter({$0.kind == "song" && $0.trackId != nil})
                if let nowPlaying = self.nowPlaying{
                    for index in 0..<tracks.count{
                        if tracks[index].trackId == nowPlaying.trackId{
                            tracks[index].nowPlaying = true
                            self.nowPlayingIndex = index
                            break
                        }
                    }
                }
                self.tracks = tracks
            case let .failure(error):
                debugPrint(error)
                self.tracks = []
            }
        }
    }
    func play(url:URL) {
        
        let playerItem = AVPlayerItem(url: url)
        self.player = AVPlayer(playerItem:playerItem)
        player?.volume = 1.0
        player?.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 2), queue: .main, using: { progress in
            let currentTimeSeconds = CMTimeGetSeconds(progress)
            if let duration = self.player?.currentItem?.duration{
                let durationSeconds = CMTimeGetSeconds(duration)
                self.seeker.value = Float(currentTimeSeconds / durationSeconds)
            }
        })
        isPlaying = true
    }
    func stop(){
        isPlaying = false
        player = nil
    }
    @IBAction func clickPlayPause(_ sender: Any) {
        isPlaying = !isPlaying
    }
    @IBAction func clickNext(_ sender: Any) {
        if let nowPlayingIndex = nowPlayingIndex , nowPlayingIndex + 1 < tracks.count - 1{
            tracks[nowPlayingIndex].nowPlaying = false
            nowPlaying = tracks[nowPlayingIndex + 1]
            self.nowPlayingIndex = nowPlayingIndex + 1
            tracks[self.nowPlayingIndex!].nowPlaying = true
        }
    }
    @IBAction func clickPrev(_ sender: Any) {
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentItem.loadedTimeRanges"{
            let player =
            debugPrint(object)
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let track = tracks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier, for: indexPath) as! MusicCell
        cell.selectionStyle = .none
        cell.titleLabel.text = track.trackName
        cell.artistLabel.text = track.artistName
        cell.albumLabel.text = track.collectionName
        cell.indicatorView.isHidden = !(track.nowPlaying ?? false)
        if let url = URL(string: track.artworkUrl60){
            cell.albumArtImageView.kf.setImage(with: url)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let nowPlayingIndex = nowPlayingIndex{
            tracks[nowPlayingIndex].nowPlaying = false
        }
        tracks[indexPath.row].nowPlaying = true
        nowPlaying = tracks[indexPath.row]
        nowPlayingIndex = indexPath.row
        snapshotTracks = tracks
        snapshotNowPlayingIndex = nowPlayingIndex
        seeker.value = 0
        tableView.reloadData()
    }
}
extension HomeVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        
    }
}

