//
//  ContentView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Eurovision_generic_black")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("Songs ranker")
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "music.quarternote.3")
                    .font(.largeTitle)
                    .padding()
                    .background(.ultraThinMaterial)
                Spacer()
                Image(systemName: "music.quarternote.3")
                    .font(.largeTitle)
                    .padding()
                    .background(.ultraThinMaterial)
                Spacer()
            }.padding()
            HStack {
                Spacer()
                Button {
                    print("button 1 clicked")
                } label: {
                    Text("Choose")
                }.buttonStyle(.bordered)
                Spacer()
                Button {
                    print("button 2 clicked")
                } label: {
                    Text("Choose")
                }.buttonStyle(.bordered)
                Spacer()
            }.padding()
            Spacer()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
