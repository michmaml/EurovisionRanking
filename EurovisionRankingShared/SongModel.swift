//
//  SongModel.swift
//  EurovisionRankingShared
//
//  Created by Michal Sekulski on 25/07/2023.
//

import Foundation

struct SongRankingModel {
    let songModel: SongModel
    var wins: Int
    var losses: Int
}

public struct SongModel {
    var id = UUID()
    let country: String
    let artist: String
    let title: String
    let videoID: String
    
    init(country: String, artist: String, title: String, videoID: String) {
        self.country = country
        self.artist = artist
        self.title = title
        self.videoID = videoID
    }
    
}

