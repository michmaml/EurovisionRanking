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
    @Published var songsLoaded = false
    
    private let maxActiveSongs = 2
    @Published var allSongs: [Song] = []
    
    private func generateActiveSongs() -> [Song] {
        return [allSongs.randomElement()!, allSongs.randomElement()!]
    }
    
    func loadSongs() async {
        do {
            //try await Task.sleep(nanoseconds: UInt64(1 * Double(NSEC_PER_SEC)))
            sleep(1)
            
            let baseSongs = try await Network().getAllSongs()
            allSongs = mapBaseSongsToSongs(for: baseSongs)
            print("API CALL WORKED")
        } catch {
            print("API CALL DID NOT WORK")
            print("Error", error)
        }
    }
    
    func startRanking() {
        songsLoaded = true
        activeSongs = generateActiveSongs()
    }
    
    func selectWinner(for winnerSong: Song) {
        // compare logic
        activeSongs = generateActiveSongs()
    }
    
    public func mapBaseSongsToSongs(for songs: [Network.BaseSong]) -> [Song] {
        return songs.map {
            Song(country: $0.countryName, artist: $0.artistName, title: $0.songName, videoID: $0.videoId, wins: 0, losses: 0)
        }
    }
}
