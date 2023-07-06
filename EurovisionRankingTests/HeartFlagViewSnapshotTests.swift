//
//  HeartFlagViewSnapshotTests.swift
//  EurovisionRankingTests
//
//  Created by Michal Sekulski on 09/06/2023.
//

import XCTest
import SnapshotTesting
import UIKit
import SwiftUI

@testable import EurovisionRanking
final class HeartFlagViewSnapshotTests: XCTestCase {
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        isRecording = false
    }
    
    func test_lightMode_heartFlagView() {
        // Given
        let countryName = "Belgium"
        
        // When
        let heartFlagView = HeartFlagView(countryName: countryName.lowercased())
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func test_darkMode_heartFlagView() {
        // Given
        let countryName = "Belgium"
        
        // When
        let heartFlagView = HeartFlagView(countryName: countryName.lowercased())
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize,
                                                   traits: .init(userInterfaceStyle: .dark))
       )
    }
    
    func test_dynamicType_heartFlagView() {
        // Given
        let countryName = "Belgium"
        
        // When
        let heartFlagView = HeartFlagView(countryName: countryName.lowercased())
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        assertSnapshot(matching: view, as: .image(size: CGSize(width: 300, height: 200),
                                                 traits: .init(preferredContentSizeCategory: .accessibilityExtraLarge))
        )
    }
    
    func test_rtl_heartFlagView() {
        // Given
        let countryName = "Belgium"
        
        // When
        let heartFlagView = HeartFlagView(countryName: countryName.lowercased())
        let view: UIView = UIHostingController(rootView: heartFlagView).view
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize,
                                                 traits: .init(layoutDirection: .rightToLeft)))
    }
}
