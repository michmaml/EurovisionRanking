//
//  SongView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

struct SongView: View {
    let song: Song
    var body: some View {
        VStack {
            Text("\(song.country)'s song:")
            VideoView(videoID: song.videoID)
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                .cornerRadius(10)
                .padding(.horizontal, 12)
        }
    }
}

struct SongView_Previews: PreviewProvider {
    static var song = Song.data.randomElement()!
    static var previews: some View {
        SongView(song: song)
    }
}
