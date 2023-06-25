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
    private var allSongs = Song.data
    
    private func generateActiveSongs() -> [Song] {
        return [allSongs.randomElement()!, allSongs.randomElement()!]
    }
    
    func loadSongs() {
        
    }
    
    func startRanking() {
        activeSongs = generateActiveSongs()
    }
    
    func selectWinner(for winnerSong: Song) {
        // compare logic
        activeSongs = generateActiveSongs()
    }
}
