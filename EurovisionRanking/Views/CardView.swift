//
//  CardView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 12/06/2023.
//

import SwiftUI
import Backpack_SwiftUI
import EurovisionRankingShared

struct CardView: View {
    let song: Song
    let buttonAction: () -> Void
    var body: some View {
        BPKCard {
            VStack {
                SongView(song: song)
                BPKButton("Choose", action: buttonAction)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var song = Song(songModel: SongModel(country: "", artist: "", title: "", videoID: ""), wins: 0, losses: 0)
    static var buttonAction: () -> Void = {}
    static var previews: some View {
        CardView(song: song, buttonAction: buttonAction)
    }
}
