//
//  CountryViewSnapshotTests.swift
//  EurovisionRankingTests
//
//  Created by Michal Sekulski on 09/06/2023.
//

import XCTest
import SnapshotTesting
import UIKit
import SwiftUI

@testable import EurovisionRanking
final class CountryViewSnapshotTests: XCTestCase {
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        isRecording = false
    }
    
    func test_lightMode_countryView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)
        
        // When
        let countryView = CountryView(song: song)
        let view: UIView = UIHostingController(rootView: countryView).view
        
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func test_darkMode_countryView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)
        
        // When
        let countryView = CountryView(song: song)
        let view: UIView = UIHostingController(rootView: countryView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize,
                                                   traits: .init(userInterfaceStyle: .dark))
       )
    }
    
    func test_dynamicType_countryView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)
        
        // When
        let countryView = CountryView(song: song)
        let view: UIView = UIHostingController(rootView: countryView).view
        assertSnapshot(matching: view, as: .image(size: CGSize(width: 300, height: 200),
                                                 traits: .init(preferredContentSizeCategory: .accessibilityExtraLarge))
        )
    }
    
    func test_rtl_countryView() {
        // Given
        let song = Song(country: "Belgium", artist: "Gustaph", title: "Because of you", videoID: "", wins: 0, losses: 0)
        
        // When
        let countryView = CountryView(song: song)
        let view: UIView = UIHostingController(rootView: countryView).view
        view.semanticContentAttribute = .forceRightToLeft
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize)
        )
    }
}
