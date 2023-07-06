//
//  ViewModel.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 21/06/2023.
//

import SwiftUI

@MainActor class ViewModel: ObservableObject {
    @Published private(set) var activeSongs = [Song]()
    @Published var finishedRanking = false
    @Published var rankedSongs = [Song]()
    private var comparedPairs = Set<String>()
    
    // MARK: - Loading
    @Published var songsLoaded = false

    
    private let maxActiveSongs = 2
    @Published var allSongs: [Song] = []
    
    private func generateActiveSongs() -> [Song] {
        return [allSongs.randomElement()!, allSongs.randomElement()!]
    }
    
    func loadSongs() async {
        do {
            sleep(1)
            let baseSongs = try await Network().getAllSongs()
            allSongs = mapBaseSongsToSongs(for: baseSongs)
            print("API CALL WORKED")
        } catch {
            print("API CALL DID NOT WORK")
            print("Error", error)
        }
    }
    
    func generateSongs() -> [Song] {
        //var songsToCompare: [Song]
        var firstSong: Song
        var secondSong: Song

        let repeatedScores = findSongsWithSameScore(forRankedSongs: rankedSongs, comparedPairs: comparedPairs)
        if rankedSongs.count == 0 || repeatedScores == nil {
           let firstIndex = Int.random(in: 0..<allSongs.count)
           firstSong = allSongs.remove(at: firstIndex)
           let secondIndex = Int.random(in: 0..<allSongs.count)
           secondSong = allSongs.remove(at: secondIndex)
        } else {
           firstSong = repeatedScores!.0
           secondSong = repeatedScores!.1
        }
        
        return [firstSong, secondSong]
    }
    
    func handleButtonBehaviour(forWinnerSong winnerSong: Song, loserSong: Song) {
        winnerSong.wins += 1
        loserSong.losses += 1
        addRankedSongs(songs: activeSongs)
        if allSongs.count == 0 {
            finishedRanking = true
        } else {
            activeSongs = generateSongs()
        }
    }
    
    func addRankedSongs(songs: [Song]) {
        songs.forEach { song in
            if let index = rankedSongs.firstIndex(where: { $0.videoID == song.videoID }) {
                rankedSongs[index] = song
            } else {
                let index = rankedSongs.firstIndex(where: {
                    $0.wins + $0.losses >= song.wins + song.losses
                }) ?? rankedSongs.endIndex
                rankedSongs.insert(song, at: index)
            }
        }
        comparedPairs.insert(getComparisonKey(forPreviousSong: songs[0], currentSong: songs[1]))
    }
    
//    func addRankedSongs(
//        forRankedSongs rankedSongs: [Song], newlyRankedSongs: [Song], comparedPairs: Set<String>) -> Void {
//        newlyRankedSongs.forEach { song in
//            if let index = rankedSongs.firstIndex(where: { $0.videoID == song.videoID }) {
//                rankedSongs[index] = song
//            } else {
//                let index = rankedSongs.firstIndex(where: {
//                    $0.wins + $0.losses >= song.wins + song.losses
//                }) ?? rankedSongs.endIndex
//                rankedSongs.insert(song, at: index)
//            }
//        }
//        comparedPairs.insert(
//            getComparisonKey(forPreviousSong: newlyRankedSongs[0], currentSong: newlyRankedSongs[1]))
//    }
    
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
    
    public func mapBaseSongsToSongs(for songs: [Network.BaseSong]) -> [Song] {
        return songs.map {
            Song(country: $0.countryName, artist: $0.artistName, title: $0.songName, videoID: $0.videoId, wins: 0, losses: 0)
        }
    }
}
