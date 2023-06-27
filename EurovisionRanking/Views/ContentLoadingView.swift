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
    private var imageView: some View =
        Image("EUROVISION_SPLASH")
            .resizable()
            .frame(width: 200, height: 200)
            .padding()
    
    var body: some View {
        VStack {
            if !viewModel.songsLoaded {
                imageView
                    .scaleEffect(viewModel.imageScale)
                    .animation(
                        .easeInOut(duration: viewModel.animationPulseLength)
                            .repeatForever(autoreverses: true),
                        value: viewModel.imageScale
                    )
            } else {
                imageView
                    .scaleEffect(viewModel.imageScale)
                    .animation(
                        .easeInOut(duration: 0.5),
                        value: viewModel.imageScale
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BPKColor.corePrimaryColor)
        .ignoresSafeArea()
        .onAppear {
            viewModel.imageScale *= 1.2
        }
    }
}

struct ContentLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentLoadingView()
    }
}
