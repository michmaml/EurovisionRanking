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
    public let country: String
    public let artist: String
    public let title: String
    public let videoID: String
    
    init(country: String, artist: String, title: String, videoID: String) {
        self.country = country
        self.artist = artist
        self.title = title
        self.videoID = videoID
    }
}

public extension SongModel {
    static var data: [SongModel] =
    [
        SongModel(country: "Spain", artist: "Blanca Paloma", title: "Eaea", videoID: "NGnEoSypBhE"),
        SongModel(country: "Serbia", artist: "Luke Black", title: "Samo mi se spava", videoID: "oeIVwYUge8o"),
        SongModel(country: "Moldova", artist: "Pasha Parfeni", title: "Soarele și Luna", videoID: "se9LDgFW6ak"),
        SongModel(country: "France", artist: "La Zarra", title: "Évidemment", videoID: "GWfbEFH9NvQ"),
        SongModel(country: "Finland", artist: "Käärijä", title: "Cha Cha Cha", videoID: "rJHe-iZ5HSI"),
        SongModel(country: "Slovenia", artist: "Joker Out", title: "Carpe Diem", videoID: "vfTiuZaESKs"),
        SongModel(country: "Georgia", artist: "Iru", title: "Echo", videoID: "E8kO-QPippo"),
        SongModel(country: "Portugal", artist: "Mimicat", title: "Ai Coração", videoID: "wa3suiOzAAk"),
        SongModel(country: "Austria", artist: "Teya & Salena", title: "Who The Hell Is Edgar?", videoID: "ZMmModelLeV47Au4"),
        SongModel(country: "Czechia", artist: "Vesna", title: "My Sister's Crown", videoID: "-y78qgDlzAM")
    ]
}

