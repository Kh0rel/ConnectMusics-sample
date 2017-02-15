//
//  ListTracksSpotifyViewController.swift
//  ConnectMusicsSample
//
//  Created by Meryl Barantal on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import ConnectMusics

class ListTracksSpotifyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var currentPlaylist:CMPlaylist?
    var providerTracks : [CMSpotifyTrack] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let spotify = ConnectMusics.sharedInstance.getInstance().getProvider(wantedProvider: .spotify) as! CMSpotifyProviderManager
        spotify.getMe { (error:String?) in
            spotify.getTracks(playlistToUpdate: self.currentPlaylist!, completionHandler: { (playlistUpdated : CMPlaylist?, error: String?) in
                if error == nil {
                    self.providerTracks = (playlistUpdated?.mediaItem as! CMSpotifyPlaylist).tracks
                    self.tableView.reloadData()
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providerTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell") as? SpotifyTracksListTableViewCell
        cell?.title.text = providerTracks[indexPath.row].name
        cell?.artist.text = providerTracks[indexPath.row].albumName
        return cell!
    }

}
