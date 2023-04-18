//
//  Song.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import Foundation

struct Song: Identifiable, Equatable {
    let id: UUID
    var country: String
    var videoID: String
    
    init(id: UUID = UUID(), country: String, videoID: String) {
        self.id = id
        self.country = country
        self.videoID = videoID
    }
}

extension Song {
    static var data: [Song] =
    [
        Song(country: "Spain", videoID: "NGnEoSypBhE"),
        Song(country: "Serbia", videoID: "oeIVwYUge8o"),
        Song(country: "Moldova", videoID: "se9LDgFW6ak"),
        Song(country: "France", videoID: "GWfbEFH9NvQ"),
        Song(country: "Finland", videoID: "rJHe-iZ5HSI"),
        Song(country: "Slovenia", videoID: "vfTiuZaESKs"),
        Song(country: "Georgia", videoID: "E8kO-QPippo"),
        Song(country: "Portugal", videoID: "wa3suiOzAAk"),
        Song(country: "Austria", videoID: "ZMmLeV47Au4"),
        Song(country: "Czechia", videoID: "-y78qgDlzAM")
    ]
}
