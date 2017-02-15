//
//  SpotifyTracksListTableViewCell.swift
//  ConnectMusicsSample
//
//  Created by Meryl Barantal on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit

class SpotifyTracksListTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
