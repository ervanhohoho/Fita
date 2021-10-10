//
//  ViewController.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier, for: indexPath) as! MusicCell
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: MusicCell.identifier, bundle: nil), forCellReuseIdentifier: MusicCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    


}

