//
//  SummaryView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 18/04/2023.
//

import SwiftUI

struct SummaryView: View {
    let songs: [Song]
    var body: some View {
        VStack {
            Image("EUROVISION")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            ScrollView {
                ForEach(Array(sortSongs(songs).enumerated()), id: \.offset) { index, song in
                    
                    HStack {
                        Text("\(index+1).")
                            .font(.title3)
                            .bold()
                        CountryView(song: song)
                    }.padding(.horizontal, 12)
                }
            }
        }
    }
    
    func sortSongs(_ rankedSongs: [Song]) -> [Song] {
        var groups: [Int: [Song]] = [:]
            for song in rankedSongs {
                let key = song.losses
                if groups[key] == nil {
                    groups[key] = []
                }
                groups[key]?.append(song)
            }

            var sortedGroups: [Song] = []
            for key in groups.keys.sorted() {
                let sortedSongs = groups[key]!.sorted { $0.wins > $1.wins }
                sortedGroups += sortedSongs
            }
            return sortedGroups
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var song = Song(country: "Poland", artist: "Michał Szpak", title: "Color of your life", videoID: "kTsruf7hQXI", wins: 0, losses: 0)
    static var previews: some View {
        SummaryView(songs: [song])
    }
}
