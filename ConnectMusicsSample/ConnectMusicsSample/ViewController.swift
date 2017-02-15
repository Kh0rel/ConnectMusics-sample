//
//  ViewController.swift
//  ConnectMusicsSample
//
//  Created by guillaume chieb bouares on 12/02/2017.
//  Copyright © 2017 com.github.shemana.application. All rights reserved.
//

import UIKit
import ConnectMusics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func spotifyAuthenticationAction(_ sender: Any) {
        ConnectMusics.sharedInstance.initProvider(provider: .spotify, clientID: "7cd76c8452a24424a2808e35fd5e0e7a", clientSecret: "cc48f54bd2c74def9456778d1fd7f9a0", redirectURI: "connectmusicsample://")
        
    }
    
}

