//
//  HeartFlagView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 09/06/2023.
//

import SwiftUI
import Backpack_SwiftUI
import EurovisionRankingShared

struct CountryView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let song: Song
    
    var body: some View {
        let layout = dynamicTypeSize <= .xxxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        
        HStack {
            layout {
                HeartFlagView(countryName: song.country.lowercased())
                
                VStack(alignment: .leading) {
                    BPKText(song.artist, style: .footnote)
                    BPKText(song.title, style: .heading4)
                }
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var song = Song(songModel: SongModel(country: "", artist: "", title: "", videoID: ""), wins: 0, losses: 0)
    static var previews: some View {
        CountryView(song: song)
    }
}
