import SwiftUI
import Backpack_SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            //Color(BPKColor.canvasColor).ignoresSafeArea()
            VStack {
                ForEach(viewModel.activeSongs) { song in
                    BPKCard {
                        VStack {
                            SongView(song: song)
                        }
                    }.onTapGesture {
                        //viewModel.selectWinner(for: song)
                    }
                }
            }
            .padding()
            .sheet(isPresented: $viewModel.finishedRanking) {
                SummaryView(songs: viewModel.rankedSongs)
            }
            
            ContentLoadingView(loading: $showSplash)
                .opacity(showSplash ? 1 : 0)
                .task {
                    await viewModel.loadSongs()
                    viewModel.generateSongs()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                      withAnimation() {
                        self.showSplash = false
                      }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
