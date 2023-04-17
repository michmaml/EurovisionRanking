//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

class SongsHelper {
    static var songs = Song.data
    static var rankedSongs: [Song] = []
    
    static func generateTwoSongs() -> (Song, Song) {
        let firstSong: Song
        let secondSong: Song

        let repeatedScores = findSongsWithSameScore()
         if rankedSongs.count == 0 || repeatedScores == nil {
            // TODO: Add a case when went through all the songs
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
    
    static func addRankedSongs(songs: [Song]) {
        songs.forEach { song in
            if let index = rankedSongs.firstIndex(where: { $0.videoID == song.videoID }) {
                rankedSongs[index].score += song.score
            } else {
                let index = rankedSongs.firstIndex(where: { $0.score >= song.score }) ?? rankedSongs.endIndex
                rankedSongs.insert(song, at: index)
            }
        }
        print(rankedSongs)
    }
    
    static func findSongsWithSameScore() -> (Song, Song)? {
        var scores: Set<Int> = []
        for song in rankedSongs {
            if scores.contains(song.score) {
                let previousSong = rankedSongs.first(where: { $0.score == song.score })!
                return (previousSong, song)
            } else {
                scores.insert(song.score)
            }
        }
        return nil
    }
}

struct ContentView: View {
    @State private var song1: Song = Song(country: "", videoID: "", score: 0)
    @State private var song2: Song = Song(country: "", videoID: "", score: 0)
    @State private var finishedRanking = false
    //let sdm = SongDataManager()
    
    var body: some View {
        VStack {
            SongView(song: song1)
            Button {
                song1.score += 1
                song2.score -= 1
                SongsHelper.addRankedSongs(songs: [song1, song2])
                (song1, song2) = SongsHelper.generateTwoSongs()
                //SongsHelper.setScores(winner: song1, loser: song2)
                //sdm.modify(string: "Clicked \(song1.country)")
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
            
            Spacer()
            Spacer()
            
            SongView(song: song2)
            Button {
                song1.score -= 1
                song2.score += 1
                SongsHelper.addRankedSongs(songs: [song1, song2])
                (song1, song2) = SongsHelper.generateTwoSongs()
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
        }.padding()
            .sheet(isPresented: $finishedRanking) {
                SecondView() // <- pass rankedListOfSongs: <rankedSongs>
            }
            .onAppear {
                if SongsHelper.songs.count == 0 {
                    finishedRanking = true
                } else {
                    let selectedSongs = SongsHelper.generateTwoSongs()
                    song1 = selectedSongs.0
                    song2 = selectedSongs.1
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecondView: View {
    //let rankedListOfSongs: [Song]
    var body: some View {
        VStack {
            Image("EUROVISION")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Sheet") // <- pass rankedListOfSongs
        }
    }
}

//class SongsDataManager: ObservedObject {
//    @Published var song1: Song
//    @Published var song2: Song
//
//    var allSongs = Song.data
//
//    init(song1: Song, song2: Song) {
//        let (song1, song2) = generateUniqueSongs()
//        self.song1 = song1
//        self.song2 = song2
//    }
//
//    public func generateUniqueSongs() -> (Song, Song) {
//        let firstSong: Song
//        let secondSong: Song
//
//        //if rankedSongs.count > 0 {
//            //firstSong
//
//            //} else {
//            let firstIndex = Int.random(in: 0..<allSongs.count)
//            firstSong = allSongs.remove(at: firstIndex)
//            let secondIndex = Int.random(in: 0..<allSongs.count)
//            secondSong = allSongs.remove(at: secondIndex)
//        //}
//        return (firstSong, secondSong)
//    }
//}
