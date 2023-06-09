//
//  SongViewModelTests.swift
//  EurovisionRankingTests
//
//  Created by Michal Sekulski on 24/05/2023.
//

import XCTest
@testable import EurovisionRanking

final class SongViewModelTests: XCTestCase {
    var sut: SongViewModel!
    
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        sut = SongViewModel()
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        sut = nil
    }

    func test_findSongsWithSameScore() {
        // given
        let rankedSongs = [
            Song(country: "Spain", videoID: "NGnEoSypBhE", wins: 3, losses: 1),
            Song(country: "Serbia", videoID: "oeIVwYUge8o", wins: 2, losses: 1),
            Song(country: "Moldova", videoID: "se9LDgFW6ak", wins: 0, losses: 0),
            Song(country: "France", videoID: "GWfbEFH9NvQ", wins: 0, losses: 0),
            Song(country: "Finland", videoID: "rJHe-iZ5HSI", wins: 0, losses: 4)
        ]
        let comparedSongs : Set = ["Serbia-Spain", "Moldova-Spain", "Finland-France", "Finland-Spain"]
        
        // when
        let result = sut.findSongsWithSameScore(forRankedSongs: rankedSongs, comparedPairs: comparedSongs)
        let expectedTuple = (Song(country: "Moldova", videoID: "se9LDgFW6ak", wins: 0, losses: 0),
                             Song(country: "France", videoID: "GWfbEFH9NvQ", wins: 0, losses: 0))
        
        // then
        XCTAssertTrue(result == expectedTuple)
    }
    
    func test_getComparisonKey() {
        // given
        let previousSong = Song(country: "Spain", videoID: "NGnEoSypBhE", wins: 0, losses: 0)
        let currentSong = Song(country: "Serbia", videoID: "oeIVwYUge8o", wins: 0, losses: 0)
        
        // when
        let result = sut.getComparisonKey(forPreviousSong: previousSong, currentSong: currentSong)
        
        // then
        XCTAssertEqual(result, "Serbia-Spain")
    }
}
