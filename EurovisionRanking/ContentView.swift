import SwiftUI
import EurovisionRankingShared
import Backpack_SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showSplash = true
    @State private var showDetail = false
    @State private var songDetail: Song?
    
    var body: some View {
        ZStack {
            //Color(BPKColor.canvasColor).ignoresSafeArea()
            VStack {
                ForEach(viewModel.activeSongs) { song in
                    SongView(song: song)
                    Button {
                        viewModel.selectWinner(for: song)
                    } label: {
                        Text("Choose")
                    }.buttonStyle(.bordered)
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
        .sheet(isPresented: $showDetail) {
            if let songDetail {
                SongView(song: songDetail)
            }
        }
        .onOpenURL { url in
            print(url)
            
            if let videoID = url.videoID {
                songDetail = SongModel.getSong(withVideoID: videoID)
                showDetail = true
                print(showDetail)
            }
        }
    }
}

extension URL {
  var isDeeplink: Bool {
    return scheme == "eurovisionranking"
  }

    var videoID: String? {
        let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        let queryItems = urlComponents?.queryItems
        
        return queryItems?.first(where: { $0.name == "videoID" })?.value
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
