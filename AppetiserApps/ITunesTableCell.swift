//
//  ITunesTableCell.swift
//  AppetiserApps
//
//  Created by Jovin Delfin on 11/10/19.
//  Copyright © 2019 JovElevin. All rights reserved.
//

import UIKit
import Kingfisher

class ITunesTableCell: UITableViewCell {
    
    lazy var trackName = UILabel()
    lazy var price = UILabel()
    lazy var genre = UILabel()
    lazy var artwork = UIImageView()
    
    var music: Music? {
        didSet {
            guard let music = music else { return }
            trackName.text = music.trackName
            
            genre.text = music.primaryGenreName
            
            artwork.kf.setImage(with: music.getMusicImageUrl60())
            
            guard let priceDouble = music.trackPrice else { return }
            price.text = "$\(priceDouble)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trackName.text = ""
        price.text = ""
        genre.text = ""
        artwork.image = nil
    }
    
    fileprivate func setupViews(){
        
        artwork.backgroundColor = .gray
        artwork.contentMode = .scaleAspectFill
        artwork.clipsToBounds = true
        
        trackName.font = UIFont.boldSystemFont(ofSize: 17)
        price.font = UIFont.boldSystemFont(ofSize: 19)
        genre.font = UIFont.systemFont(ofSize: 15)
        
        trackName.adjustsFontSizeToFitWidth = true
        trackName.minimumScaleFactor = 0.5
        
        addSubview(artwork)
        addSubview(trackName)
        addSubview(price)
        addSubview(genre)
        
        artwork.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        trackName.anchor(top: artwork.topAnchor, left: artwork.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        genre.anchor(top: trackName.bottomAnchor, left: trackName.leftAnchor, bottom: nil, right: trackName.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        price.anchor(top: genre.bottomAnchor, left: trackName.leftAnchor, bottom: bottomAnchor, right: genre.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
        
    }
}
