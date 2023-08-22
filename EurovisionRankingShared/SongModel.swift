//
//  SongModel.swift
//  EurovisionRankingShared
//
//  Created by Michal Sekulski on 25/07/2023.
//

import Foundation

public class Song: Identifiable {
    public var id = UUID()
    public let songModel: SongModel
    public var wins: Int
    public var losses: Int
    
    public init(songModel: SongModel, wins: Int, losses: Int) {
        self.songModel = songModel
        self.wins = wins
        self.losses = losses
    }
    
    public var country: String { return songModel.country }
    public var artist: String { return songModel.artist }
    public var title: String { return songModel.title }
    public var videoID: String { return songModel.videoID }
}

public struct SongModel {
    var id = UUID()
    public let country: String
    public let artist: String
    public let title: String
    public let videoID: String
    
    public init(country: String, artist: String, title: String, videoID: String) {
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
    
    static func getSong(withVideoID videoID: String) -> Song? {
        guard let songModel = SongModel.data.first(where: { $0.videoID == videoID}) else { return nil }
        return Song(songModel: songModel, wins: 0, losses: 0)
    }
}
