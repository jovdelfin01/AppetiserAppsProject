//
//  DetailViewController.swift
//  AppetiserApps
//
//  Created by Jovin Delfin on 11/10/19.
//  Copyright © 2019 JovElevin. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    
    var music: Music? {
        didSet {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDefaults = UserDefaults.standard
        //let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: music)
        userDefaults.set("detail", forKey: "currentController")
        //userDefaults.set(encodedData, forKey: "groups")
        userDefaults.synchronize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMusicDetail()
    }
    
    fileprivate func setupMusicDetail() {
        guard let music = music else { return }
        
        navigationItem.title = music.trackName
        
        if let trackName = music.trackName {
            trackNameLabel.text = trackName
        }
        
        
        genreLabel.text = music.primaryGenreName
        
        trackImageView.kf.setImage(with: music.getMusicImageUrl100())
        
        if let description = music.longDescription {
            longDescriptionLabel.text = description
        }
        guard let priceDouble = music.trackPrice else { return }
        priceLabel.text = "$\(priceDouble)"
    }


}

