//
//  CompareASo.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 24/05/2023.
//

import Foundation

struct SongViewModel {
    func findSongsWithSameScore(_ rankedSongs: [Song], _ comparedPairs: Set<String>) -> (Song, Song)? {
        var scores: Set<Int> = []
        for song in rankedSongs {
            if scores.contains(song.wins) {
                let previousSong = rankedSongs.first(where: {
                    $0.wins + $0.losses >= song.wins + song.losses
                })!
                if (!comparedPairs.contains(getComparisonKey([previousSong, song])) &&
                    previousSong.videoID != song.videoID) {
                    return (previousSong, song)
                }
            } else {
                scores.insert(song.wins)
            }
        }
        return nil
    }
    
    func getComparisonKey(_ songs: [Song]) -> String {
        let sortedStrings = [songs[0].country, songs[1].country].sorted()
        return sortedStrings.joined(separator: "-")
    }
}
