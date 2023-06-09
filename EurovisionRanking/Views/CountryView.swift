//
//  HeartFlagView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 09/06/2023.
//

import SwiftUI

struct CountryView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let song: Song
    
    var body: some View {
        let layout = dynamicTypeSize <= .xxxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        
        HStack {
            layout {
                HeartFlagView(countryName: song.country.lowercased())
                
                VStack(alignment: .leading) {
                    Text(song.artist)
                        .font(.headline)
                    Text(song.title)
                        .font(.subheadline)
                }
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(song: Song.data.randomElement()!)
    }
}
