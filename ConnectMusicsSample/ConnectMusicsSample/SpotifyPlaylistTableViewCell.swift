//
//  SpotifyPlaylistTableViewCell.swift
//  ConnectMusicsSample
//
//  Created by Meryl Barantal on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit

class SpotifyPlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var playlistTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
