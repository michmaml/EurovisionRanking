//
//  CardView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 12/06/2023.
//

import SwiftUI

struct CardView: View {
    let song: Song
    var buttonAction: () -> Void
    var body: some View {
        SongView(song: song)
        Button {
            self.buttonAction()
        } label: {
            Text("Choose")
        }.buttonStyle(.bordered)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(song: Song.data.randomElement()!)
    }
}
