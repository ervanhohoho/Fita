//
//  MusicCell.swift
//  Fita-Music
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import UIKit

class MusicCell: UITableViewCell {

    static let identifier = "MusicCell"
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
