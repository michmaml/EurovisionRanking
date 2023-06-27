import SwiftUI
import Backpack_SwiftUI

struct ContentLoadingView: View {
    private let animationPulseLength = 0.8
    private let fadeOut = false
    @State private var imageScale = 1.0
    
    @Binding private var loading: Bool
    
    init(loading: Binding<Bool>) {
        self._loading = loading
    }
    
    private var imageView: some View =
        Image("EUROVISION_SPLASH")
            .resizable()
            .frame(width: 200, height: 200)
            .padding()
    
    var body: some View {
        VStack {
            imageView
                .scaleEffect(loading ? imageScale : imageScale * 5)
                .animation(
                    .easeInOut(duration: animationPulseLength)
                        .repeatForever(autoreverses: true),
                    value: imageScale
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BPKColor.corePrimaryColor)
        .ignoresSafeArea()
        .onAppear {
            imageScale *= 1.2
        }
    }
}

struct ContentLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentLoadingView(loading: .constant(false))
    }
}
