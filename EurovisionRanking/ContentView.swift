//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

//class SongsHelper {
//    static var songs = Song.data
//    static var rankedSongs: [Song] = []
//    static var comparedPairs: Set<String> = []
//
//    static func generateTwoSongs() -> (Song, Song) {
//        let firstSong: Song
//        let secondSong: Song
//
//        // The first song always comes from the original list
//        let firstIndex = Int.random(in: 0..<songs.count)
//        firstSong = songs.remove(at: firstIndex)
//        if rankedSongs.count != 0 {
//            let middleIndex = (rankedSongs.count-1)/2       // TODO: this will be dynimic
//            secondSong = rankedSongs[middleIndex]
//        } else {
//            let secondIndex = Int.random(in: 0..<songs.count)
//            secondSong = songs.remove(at: secondIndex)
//        }
//        return (firstSong, secondSong)
//    }
//
//    static func addRankedSongs(songs: [Song]) {
//        songs.forEach { song in
//            if let index = rankedSongs.firstIndex(where: { $0.videoID == song.videoID }) {
//                rankedSongs[index] = song
//            } else {
//                let index = rankedSongs.firstIndex(where: {
//                    $0.wins >= song.wins
//                }) ?? rankedSongs.endIndex
//                rankedSongs.insert(song, at: index)
//                //adjustWins(index + 1)
//            }
//        }
//        comparedPairs.insert(getComparisonKey(songs))
//        print(comparedPairs)
//    }
//
//    static func findSongsWithSameScore() -> (Song, Song)? {
//        var scores: Set<Int> = []
//        for song in rankedSongs {
//            if scores.contains(song.wins) {
//                let previousSong = rankedSongs.first(where: {
//                    $0.wins >= song.wins
//                })!
//                if !comparedPairs.contains(getComparisonKey([previousSong, song])) {
//                    return (previousSong, song)
//                }
//            } else {
//                scores.insert(song.wins)
//            }
//        }
//        return nil
//    }
//
//    static func adjustWins(_ index: Int) -> Void {
//        //var result = rankedSongs
//        for i in index-1..<rankedSongs.count-1 {
//            rankedSongs[i].wins += rankedSongs[i+1].wins
//        }
//        //rankedSongs = result
//    }
//
//    static func getComparisonKey(_ songs: [Song]) -> String {
//        let sortedStrings = [songs[0].country, songs[1].country].sorted()
//        return sortedStrings.joined(separator: "-")
//    }
//
//    static func sortSongs(_ adam: [Song]) -> [Song] {
//        return adam.sorted {
//            $0.losses < $1.losses
//        }.sorted { $0.wins > $1.wins }
//    }
//}

struct ContentView: View {
    @State private var song1: Song = Song(country: "", videoID: "")
    @State private var song2: Song = Song(country: "", videoID: "")
    @State private var unrankedSongs: [Song] = Song.data
    @State private var rankedSongs: [Song] = []
    @State private var queueSongs: [Song]
    @State private var currentRankedIndex: Int
    
    var body: some View {
        VStack {
            SongView(song: song1)
            Button {
                allocateSongsToRankedArray(song1, song2)
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
            
            Spacer()
            Spacer()
            
            SongView(song: song2)
            Button {
                allocateSongsToRankedArray(song2, song1)
            } label: {
                Text("Choose")
            }.buttonStyle(.bordered)
        }.padding()
//            .sheet(isPresented: $finishedRanking) {
//                RankingView(rankedListOfSongs: SongsHelper.rankedSongs)
//            }
            .onAppear {
                (song1, song2) = generateTwoSongs()
            }
    }
    
    func generateTwoSongs() -> (Song, Song) {
        let firstSong: Song
        let secondSong: Song

        // The first song always comes from the original list
        let firstIndex = Int.random(in: 0..<unrankedSongs.count)
        firstSong = unrankedSongs.remove(at: firstIndex)
        if rankedSongs.count != 0 {
            secondSong = rankedSongs[currentRankedIndex]
        } else {
            let secondIndex = Int.random(in: 0..<unrankedSongs.count)
            secondSong = unrankedSongs.remove(at: secondIndex)
        }
        return (firstSong, secondSong)
    }
    
    func allocateSongsToRankedArray(_ winner: Song, _ looser: Song) -> Void {
        if (rankedSongs.count == 0) {
            rankedSongs.append(contentsOf: [winner, looser])
        } else {
            var high = rankedSongs.count-1
            var low = 0
                
            while low <= high {
                let mid = (low + high) / 2
                
                if num < arr[mid] {
                    high = mid - 1
                } else if num > arr[mid] {
                    low = mid + 1
                } else {
                    arr.insert(num, at: mid)
                    return
                }
            }
            
            arr.insert(num, at: low)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RankingView: View {
    let rankedListOfSongs: [Song]
    var body: some View {
        VStack {
            Image("EUROVISION")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
//            ForEach(SongsHelper.sortSongs(rankedListOfSongs)) { song in
//                Text("\(song.country), W = \(song.wins) | L = \(song.losses)")
//            }
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
