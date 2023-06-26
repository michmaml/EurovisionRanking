//
//  ContentLoadingView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 23/06/2023.
//

import SwiftUI
import Backpack_SwiftUI

struct ContentLoadingView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var imageScale = 1.0
    @State private var fadeOut = false
    private var imageView: some View =
        Image("EUROVISION_SPLASH")
            .resizable()
            .frame(width: 200, height: 200)
            .padding()
    
    var body: some View {
        VStack {
            if !viewModel.songsLoaded {
                imageView
                    .scaleEffect(imageScale)
                    .animation(
                        .easeInOut(duration: 0.8)
                            .repeatForever(autoreverses: true),
                        value: imageScale
                    )
            } else {
                imageView
                    .scaleEffect(imageScale)
                    .animation(
                        .easeInOut(duration: 0.5),
                        value: imageScale
                    )
            }
            Button("\(viewModel.songsLoaded ? "Start" : "Loading")") {
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BPKColor.corePrimaryColor)
        .ignoresSafeArea()
        .onAppear {
            imageScale *= 1.2
        }
        .onChange(of: viewModel.songsLoaded) { _ in
            withAnimation(
                Animation.easeInOut(duration: 0.7), {
                    fadeOut = true
                    imageScale *= 10
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
