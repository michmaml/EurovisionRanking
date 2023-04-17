//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    let songs: [Song]
    
    var body: some View {
        VStack {
//            Image("EUROVISION")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)

            SongView(song: songs.randomElement()!)
            
            Spacer()
            Spacer()
            
            SongView(song: songs.randomElement()!)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(songs: Song.data)
    }
}
