//
//  SongViewSnapshotTests.swift
//  EurovisionRankingTests
//
//  Created by Michal Sekulski on 12/06/2023.
//

import XCTest
import SnapshotTesting
import UIKit
import SwiftUI

@testable import EurovisionRanking
final class SongViewSnapshotTests: XCTestCase {

    override func setUpWithError() throws {
        try? super.setUpWithError()
        isRecording = false
    }
    
    func test_lightMode_songView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)
        
        // When
        let heartFlagView = SongView(song: song)
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func test_darkMode_songView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)

        // When
        let heartFlagView = SongView(song: song)
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize,
                                                   traits: .init(userInterfaceStyle: .dark))
       )
    }
    
    func test_dynamicType_songView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)

        // When
        let heartFlagView = SongView(song: song)
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        sleep(3)
        assertSnapshot(matching: view, as: .image(size: CGSize(width: 300, height: 200),
                                                 traits: .init(preferredContentSizeCategory: .accessibilityExtraLarge))
        )
    }
    
    func test_rtl_songView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)

        // When
        let heartFlagView = SongView(song: song)
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize,
                                                 traits: .init(layoutDirection: .rightToLeft)))
    }
}
