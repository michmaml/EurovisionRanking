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
        
        //if rankedSongs.count > 0 {
            //firstSong
            
            //} else {
            let firstIndex = Int.random(in: 0..<songs.count)
            firstSong = songs.remove(at: firstIndex)
            let secondIndex = Int.random(in: 0..<songs.count)
            secondSong = songs.remove(at: secondIndex)
        //}
        return (firstSong, secondSong)
    }
    
    static func assignScores(winner: Song, loser: Song) {
        print("winner: \(winner.country)")
    }
}

struct ContentView: View {
    @State private var song1: Song = Song(country: "", videoID: "", score: 0)
    @State private var song2: Song = Song(country: "", videoID: "", score: 0)
    
    let sdm = SongDataManager()
    
    var body: some View {
        VStack {
//            Image("EUROVISION")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
            SongView(song: song1)
            Button {
                SongsHelper.assignScores(winner: song1, loser: song2)
                //sdm.modify(string: "Clicked \(song1.country)")
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
            
            Spacer()
            Spacer()
            
            SongView(song: song2)
            Button {
                sdm.modify(string: "Clicked \(song2.country)")
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
        }.padding()
            .onAppear {
                let selectedSongs = SongsHelper.generateTwoSongs()
                song1 = selectedSongs.0
                song2 = selectedSongs.1
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
