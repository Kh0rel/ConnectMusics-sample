//
//  ListPlaylistsSpotifyTableViewController.swift
//  ConnectMusicsSample
//
//  Created by Meryl Barantal on 15/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import ConnectMusics

class ListPlaylistsSpotifyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var providerPlaylists:[CMPlaylist] = []
    var currentIndex:Int = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let spotify = ConnectMusics.sharedInstance.getInstance().getProvider(wantedProvider: .spotify)
        spotify?.getPlaylists(completionHandler: { (error :  String?) in
            if error == nil {
               self.providerPlaylists =  ConnectMusics.sharedInstance.getInstance().getPlaylistsByProviderType(providerType: .spotify)!
                self.tableView.reloadData()
            }
        
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providerPlaylists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell") as? SpotifyPlaylistTableViewCell
        cell?.playlistTitle.text = providerPlaylists[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "detailPlaylist", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailPlaylist" {
            let viewController = segue.destination as! ListTracksSpotifyViewController
            viewController.currentPlaylist = providerPlaylists[currentIndex]
        }
    }
}
