//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 07/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EurovisionAppView()
                .tabItem {
                Label("Eurovision", systemImage: "music.note")
            }
            
            PasswordGameView()
                .tabItem {
                Label("Password Game", systemImage: "gamecontroller")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
