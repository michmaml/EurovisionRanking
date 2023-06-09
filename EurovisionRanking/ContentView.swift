//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var songs = Song.data
    @State var rankedSongs: [Song] = []
    @State var comparedPairs: Set<String> = []
    @State private var song1: Song = Song(country: "", artist: "", title: "", videoID: "", wins: 0, losses: 0)
    @State private var song2: Song = Song(country: "", artist: "", title: "", videoID: "", wins: 0, losses: 0)
    @State private var finishedRanking = false
    
    var body: some View {
        VStack {
            SongView(song: song1)
            Button {
                song1.wins += 1
                song2.losses += 1
                addRankedSongs(songs: [song1, song2])
                if songs.count == 0 {
                    finishedRanking = true
                } else {
                    (song1, song2) = generateTwoSongs()
                }
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
            
            Spacer()
            Spacer()
            
            SongView(song: song2)
            Button {
                song1.losses += 1
                song2.wins += 1
                addRankedSongs(songs: [song1, song2])
                if songs.count == 0 {
                    finishedRanking = true
                } else {
                    (song1, song2) = generateTwoSongs()
                }
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
        }.padding()
            .sheet(isPresented: $finishedRanking) {
                SummaryView(songs: rankedSongs)
            }
            .onAppear {
                if songs.count == 0 {
                    finishedRanking = true
                } else {
                    let selectedSongs = generateTwoSongs()
                    song1 = selectedSongs.0
                    song2 = selectedSongs.1
                }
            }
    }
    
    func generateTwoSongs() -> (Song, Song) {
        var firstSong: Song
        var secondSong: Song

        var repeatedScores = findSongsWithSameScore()
        if rankedSongs.count == 0 || repeatedScores == nil {
           let firstIndex = Int.random(in: 0..<songs.count)
           firstSong = songs.remove(at: firstIndex)
           let secondIndex = Int.random(in: 0..<songs.count)
           secondSong = songs.remove(at: secondIndex)
        } else {
           firstSong = repeatedScores!.0
           secondSong = repeatedScores!.1
        }
        
        return (firstSong, secondSong)
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
        comparedPairs.insert(getComparisonKey(songs))
    }
    
    func findSongsWithSameScore() -> (Song, Song)? {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
