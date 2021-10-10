//
//  ViewController.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import UIKit
import Combine

class HomeVC: UIViewController{
    var subscriptions: Set<AnyCancellable> = []
    let searchController = UISearchController()
    var musicAPI: MusicAPI = MusicAPIImpl.instance
    @Published var searchText: String = String()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: MusicCell.identifier, bundle: nil), forCellReuseIdentifier: MusicCell.identifier)
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
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier, for: indexPath) as! MusicCell
        return cell
    }
}
extension HomeVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        
    }
}

