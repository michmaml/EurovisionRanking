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

    func test_getComparisonKey() {
        // given
        let songs = [
            Song(country: "Spain", videoID: "NGnEoSypBhE", wins: 0, losses: 0),
            Song(country: "Serbia", videoID: "oeIVwYUge8o", wins: 0, losses: 0),
            Song(country: "Moldova", videoID: "se9LDgFW6ak", wins: 0, losses: 0)
        ]
        
        // when
        let result = sut.getComparisonKey(songs)
        
        // then
        XCTAssertEqual(result, "Spain-Serbia")
        
    }
}
