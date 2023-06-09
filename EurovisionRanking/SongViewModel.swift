//
//  CompareASo.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 24/05/2023.
//

import Foundation

struct SongViewModel {
    func findSongsWithSameScore(forRankedSongs rankedSongs: [Song], comparedPairs: Set<String>) -> (Song, Song)? {
        var scores: Set<Int> = []
        for song in rankedSongs {
            if scores.contains(song.wins) {
                let previousSong = rankedSongs.first(where: {
                    $0.wins + $0.losses >= song.wins + song.losses
                })!
                
                let comparisonKey = getComparisonKey(forPreviousSong: previousSong, currentSong: song)
                if !comparedPairs.contains(comparisonKey) &&
                    previousSong.videoID != song.videoID {
                    return (previousSong, song)
                }
            } else {
                scores.insert(song.wins)
            }
        }
        return nil
    }
    
    func getComparisonKey(forPreviousSong previousSong: Song, currentSong: Song) -> String {
        let sortedStrings = [previousSong.country, currentSong.country].sorted()
        return sortedStrings.joined(separator: "-")
    }
}
