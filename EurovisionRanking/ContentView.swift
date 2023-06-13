//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI
import Backpack_SwiftUI

struct ContentView: View {
    let network = Network()
    @State var baseSongs = [Network.BaseSong]()
    @State var songs = [Song]()
    @State var rankedSongs: [Song] = []
    @State var comparedPairs: Set<String> = []
    @State private var song1: Song = Song(country: "", artist: "", title: "", videoID: "", wins: 0, losses: 0)
    @State private var song2: Song = Song(country: "", artist: "", title: "", videoID: "", wins: 0, losses: 0)
    @State private var finishedRanking = false
    let svm: SongViewModel
    
    var body: some View {
        ZStack {
            Color(BPKColor.canvasColor).ignoresSafeArea()
            VStack {
                BPKCard {
                    VStack {
                        SongView(song: song1)
                        BPKButton("Choose", action: {
                            song1.wins += 1
                            song2.losses += 1
                            addRankedSongs(songs: [song1, song2])
                            if songs.count == 0 {
                                finishedRanking = true
                            } else {
                                (song1, song2) = generateTwoSongs()
                            }
                        })
                    }
                }

                Spacer()
                Spacer()

                BPKCard {
                    VStack {
                        SongView(song: song2)
                        BPKButton("Choose", action: {
                            song2.wins += 1
                            song1.losses += 1
                            addRankedSongs(songs: [song1, song2])
                            if songs.count == 0 {
                                finishedRanking = true
                            } else {
                                (song1, song2) = generateTwoSongs()
                            }
                        })
                    }
                }
            }
            .padding()
            .sheet(isPresented: $finishedRanking) {
                SummaryView(songs: rankedSongs)
            }
        }
        .task {
            do {
                baseSongs = try await network.getAllSongs()
                mapBaseSongsToSongs()
                if songs.count == 0 {
                    finishedRanking = true
                } else {
                    let selectedSongs = generateTwoSongs()
                    song1 = selectedSongs.0
                    song2 = selectedSongs.1
                }
            } catch {
                print("Error", error)
            }
        }
    }
    
    func mapBaseSongsToSongs() {
        songs = baseSongs.map {
            Song(country: $0.countryName, artist: $0.artistName, title: $0.songName, videoID: $0.videoId, wins: 0, losses: 0)
        }
    }
    
    func generateTwoSongs() -> (Song, Song) {
        var firstSong: Song
        var secondSong: Song

        let repeatedScores = svm.findSongsWithSameScore(forRankedSongs: rankedSongs, comparedPairs: comparedPairs)
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
        comparedPairs.insert(svm.getComparisonKey(forPreviousSong: songs[0], currentSong: songs[1]))
    }
    
//    func handleButtonBehaviour(forWinnerSong winnerSong: Song, loserSong: Song) {
//        winnerSong.wins += 1
//        loserSong.losses += 1
//        addRankedSongs(songs: [winnerSong, loserSong])
//        if songs.count == 0 {
//            finishedRanking = true
//        } else {
//            (song1, song2) = generateTwoSongs()
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(svm: SongViewModel())
    }
}
