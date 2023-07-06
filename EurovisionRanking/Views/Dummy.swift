//
//  Dummy.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 29/06/2023.
//

import SwiftUI

struct Dummy: View {
    @State var counter = 0
    let colours: [Color] = [.red, .green, .blue]
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(colours.randomElement()!)
            Button("\(counter)") {
                counter += 1
            }
        }
    }
}

struct Dummy_Previews: PreviewProvider {
    static var previews: some View {
        Dummy()
    }
}

@MainActor class DummyViewModel: ObservableObject {
    @Published var counter1 = 0
    @Published var counter2 = 0
}
