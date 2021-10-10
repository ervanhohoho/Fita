//
//  ViewController.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import UIKit
import Combine
import Kingfisher

class HomeVC: UIViewController{
    var subscriptions: Set<AnyCancellable> = []
    let searchController = UISearchController()
    var musicAPI: MusicAPI = MusicAPIImpl.instance
    @Published var searchText: String = String()
    var tracks: [TrackModel] = []{
        didSet{
            DispatchQueue.main.async{self.tableView.reloadData()}
        }
    }
    var nowPlaying: TrackModel? = nil
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MusicCell", bundle: nil), forCellReuseIdentifier: MusicCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        $searchText.debounce(for: .milliseconds(500), scheduler: RunLoop.main).sink(receiveValue: { value in
            self.apiCall()
        }).store(in: &subscriptions)
    }
    
    func apiCall(){
        musicAPI.searchByQuery(query: searchText) { res in
            switch res{
            case let .success(response):
                debugPrint(response)
                self.tracks = response.results.filter({$0.kind == "song" && $0.trackId != nil})
            case let .failure(error):
                debugPrint(error)
                self.tracks = []
            }
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
        for index in 0..<tracks.count {
            if tracks[index].trackId == nowPlaying?.trackId{
                tracks[index].nowPlaying = false
            }
        }
        tracks[indexPath.row].nowPlaying = true
        nowPlaying = tracks[indexPath.row]
        tableView.reloadData()
    }
}
extension HomeVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        
    }
}

