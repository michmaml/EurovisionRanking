//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI
import Backpack_SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        ZStack {
            Color(BPKColor.canvasColor).ignoresSafeArea()
            VStack {
                ForEach(viewModel.activeSongs) { song in
                    BPKCard {
                        VStack {
                            SongView(song: song)
                        }
                    }.onTapGesture {
                        viewModel.selectWinner(for: song)
                    }
                }
            }
            .padding()
            .sheet(isPresented: $viewModel.finishedRanking) {
                //SummaryView(songs: rankedSongs)
            }
            .onAppear { // <- change to onload
                viewModel.loadSongs()
                // load data from api, viewModel.onAppStart()
                // ^ this will trigger the loading state
                // ^^ add loading screen
                viewModel.startRanking()
            }
            ContentLoadingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
