//
//  EurovisionRankingApp.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

@main
struct EurovisionRankingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    print(url)
                }
        }
    }
}
