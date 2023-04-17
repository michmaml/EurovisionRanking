//
//  Song.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import Foundation

struct Song: Identifiable {
    let id: UUID
    var country: String
    var videoID: String
    var wins: Int
    var losses: Int
    
    init(id: UUID = UUID(), country: String, videoID: String, wins: Int, losses: Int) {
        self.id = id
        self.country = country
        self.videoID = videoID
        self.wins = wins
        self.losses = losses
    }
}

extension Song {
    static var data: [Song] =
    [
        Song(country: "Spain", videoID: "NGnEoSypBhE", wins: 0, losses: 0),
        Song(country: "Serbia", videoID: "oeIVwYUge8o", wins: 0, losses: 0),
        Song(country: "Moldova", videoID: "se9LDgFW6ak", wins: 0, losses: 0),
        Song(country: "France", videoID: "GWfbEFH9NvQ", wins: 0, losses: 0),
        Song(country: "Finland", videoID: "rJHe-iZ5HSI", wins: 0, losses: 0),
        Song(country: "Slovenia", videoID: "vfTiuZaESKs", wins: 0, losses: 0),
        Song(country: "Georgia", videoID: "E8kO-QPippo", wins: 0, losses: 0),
        Song(country: "Portugal", videoID: "wa3suiOzAAk", wins: 0, losses: 0),
        Song(country: "Austria", videoID: "ZMmLeV47Au4", wins: 0, losses: 0),
        Song(country: "Czechia", videoID: "-y78qgDlzAM", wins: 0, losses: 0)
    ]
}
