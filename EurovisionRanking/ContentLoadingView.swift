//
//  ContentLoadingView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 23/06/2023.
//

import SwiftUI
import Backpack_SwiftUI

struct ContentLoadingView: View {
    @State private var dataLoaded = false
    @State private var xyz = 1.0
    @State private var fadeOut = false
    private var imageView: some View =
        Image("EUROVISION_SPLASH")
            .resizable()
            .frame(width: 200, height: 200)
            .padding()
    
    var body: some View {
        VStack {
            if !dataLoaded {
                imageView
                    .scaleEffect(xyz)
                    .animation(
                        .easeInOut(duration: 0.8)
                            .repeatForever(autoreverses: true),
                        value: xyz
                    )
            } else {
                imageView
                    .scaleEffect(xyz)
                    .animation(
                        .easeInOut(duration: 0.5),
                        value: xyz
                    )
            }
            Button("1111") {
                dataLoaded = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BPKColor.corePrimaryColor)
        .ignoresSafeArea()
        .onAppear {
            xyz *= 1.2
        }
        .onChange(of: dataLoaded) { _ in
            withAnimation(
                Animation.easeInOut(duration: 0.7), {
                    fadeOut = true
                    xyz *= 10
                })
        }
        .opacity(fadeOut ? 0 : 1)
    }
}

struct ContentLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentLoadingView()
    }
}
