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
    var score: Int
    
    init(id: UUID = UUID(), country: String, videoID: String, score: Int) {
        self.id = id
        self.country = country
        self.videoID = videoID
        self.score = score
    }
}

extension Song {
    static var data: [Song] =
    [
        Song(country: "Spain", videoID: "NGnEoSypBhE", score: 0),
        Song(country: "Serbia", videoID: "oeIVwYUge8o", score: 0),
        Song(country: "Moldova", videoID: "se9LDgFW6ak", score: 0),
        Song(country: "France", videoID: "GWfbEFH9NvQ", score: 0),
        Song(country: "Finland", videoID: "rJHe-iZ5HSI", score: 0),
        Song(country: "Slovenia", videoID: "vfTiuZaESKs", score: 0),
        Song(country: "Georgia", videoID: "E8kO-QPippo", score: 0),
        Song(country: "Portugal", videoID: "wa3suiOzAAk", score: 0),
        Song(country: "Austria", videoID: "ZMmLeV47Au4", score: 0),
        Song(country: "Czechia", videoID: "-y78qgDlzAM", score: 0)
    ]
}

//extension Song {
//    public func rankStrings(_ songs: [String]) -> [Song] {
//        var remainingSongs = songs.map { Song($0) }
//        var rankedStrings: [StringRating] = []
//
//        while remainingStrings.count > 1 {
//            // Remove two random strings from the array
//            let index1 = Int.random(in: 0..<remainingStrings.count)
//            let string1 = remainingStrings.remove(at: index1)
//            let index2 = Int.random(in: 0..<remainingStrings.count)
//            let string2 = remainingStrings.remove(at: index2)
//
//            // Ask the user to pick their preferred string
//            let winner: StringRating
//            let loser: StringRating
//            if askUserForPreference(string1.string, string2.string) == string1.string {
//                winner = string1
//                loser = string2
//            } else {
//                winner = string2
//                loser = string1
//            }
//
//            // Update the ratings of the strings
//            winner.rating += 1
//            loser.rating -= 1
//
//            // Add the winner to the ranked array
//            rankedStrings.append(winner)
//
//            // If there is already a string with the same rating in the ranked array, ask the user to pick again
//            if rankedStrings.filter({ $0.rating == winner.rating }).count > 1 {
//                let otherWinner = rankedStrings.filter({ $0.rating == winner.rating }).dropLast().first!
//                if askUserForPreference(winner.string, otherWinner.string) == winner.string {
//                    rankedStrings.removeLast()
//                } else {
//                    rankedStrings = rankedStrings.filter({ $0 != winner })
//                    loser.rating += 1
//                    remainingStrings.append(loser)
//                }
//            } else {
//                remainingStrings.append(loser)
//            }
//        }
//
//        // Add the last string to the ranked array
//        rankedStrings.append(remainingStrings[0])
//
//        return rankedStrings
//    }
//
//    func askUserForPreference(_ string1: String, _ string2: String) -> String {
//        // This function should ask the user to pick their preferred string and return it
//        // Here is some example code that just returns the first string
//        return string1
//    }
//
//}
