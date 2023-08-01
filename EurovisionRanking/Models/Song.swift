////
////  Song.swift
////  EurovisionRanking
////
////  Created by Michal Sekulski on 17/04/2023.
////
//
//import Foundation
//
//class Song: Identifiable, Decodable {
//    var id = UUID()
//    let country: String
//    
//    let artist: String
//    let title: String
//    let videoID: String
//    
//    var wins: Int
//    var losses: Int
//    
//    init(country: String, artist: String, title: String, videoID: String, wins: Int, losses: Int) {
//        self.country = country
//        self.artist = artist
//        self.title = title
//        self.videoID = videoID
//        self.wins = wins
//        self.losses = losses
//    }
//}
//
//extension Song {
//    static var data: [Song] =
//    [
//        Song(country: "Spain", artist: "Blanca Paloma", title: "Eaea", videoID: "NGnEoSypBhE", wins: 0, losses: 0),
//        Song(country: "Serbia", artist: "Luke Black", title: "Samo mi se spava", videoID: "oeIVwYUge8o", wins: 0, losses: 0),
//        Song(country: "Moldova", artist: "Pasha Parfeni", title: "Soarele și Luna", videoID: "se9LDgFW6ak", wins: 0, losses: 0),
//        Song(country: "France", artist: "La Zarra", title: "Évidemment", videoID: "GWfbEFH9NvQ", wins: 0, losses: 0),
//        Song(country: "Finland", artist: "Käärijä", title: "Cha Cha Cha", videoID: "rJHe-iZ5HSI", wins: 0, losses: 0),
//        Song(country: "Slovenia", artist: "Joker Out", title: "Carpe Diem", videoID: "vfTiuZaESKs", wins: 0, losses: 0),
//        Song(country: "Georgia", artist: "Iru", title: "Echo", videoID: "E8kO-QPippo", wins: 0, losses: 0),
//        Song(country: "Portugal", artist: "Mimicat", title: "Ai Coração", videoID: "wa3suiOzAAk", wins: 0, losses: 0),
//        Song(country: "Austria", artist: "Teya & Salena", title: "Who The Hell Is Edgar?", videoID: "ZMmLeV47Au4", wins: 0, losses: 0),
//        Song(country: "Czechia", artist: "Vesna", title: "My Sister's Crown", videoID: "-y78qgDlzAM", wins: 0, losses: 0)
//    ]
//}
