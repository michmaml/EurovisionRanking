//
//  BinarySearchButSortingAlgorithm.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 10/07/2023.
//

import Foundation
import EurovisionRankingShared

class SortingAlgorithm {
    var sortedSongs = [Song]()
    var remainingComparisons = 0
    
    init(sortedSongs: [Song] = [Song]()) {
        self.sortedSongs = sortedSongs
    }
    
    func insert(for sortedSongs: [Song], songToInsert: Song) {
        let middleSong = sortedSongs.count / 2
    }
}
