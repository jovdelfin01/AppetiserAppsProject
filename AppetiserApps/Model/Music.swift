//
//  Music.swift
//  AppetiserApps
//
//  Created by Jovin Delfin on 11/11/19.
//  Copyright © 2019 JovElevin. All rights reserved.
//

import UIKit

// MARK: Music Model
// Made the model decodable and added functions to return image urls from model
struct Music: Decodable {
    let trackName: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let trackPrice: Double?
    let primaryGenreName: String?
    let longDescription: String?
    
    func getMusicImageUrl60() -> URL {
    
        if let imageUrlString = artworkUrl60 {
            let url = URL(string: imageUrlString)
            return url!
        }
        
        let placeholderUrl = URL(string:"https://via.placeholder.com/150")
        return placeholderUrl!
    }
    
    func getMusicImageUrl100() -> URL {
    
        if let imageUrlString = artworkUrl100 {
            let url = URL(string: imageUrlString)
            return url!
        }
        
        let placeholderUrl = URL(string:"https://via.placeholder.com/150")
        return placeholderUrl!
    }
}

struct MusicResultsAPI: Decodable {
    let resultCount: Int
    let results: [Music]
}
