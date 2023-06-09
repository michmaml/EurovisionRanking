//
//  HeartFlagView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 09/06/2023.
//

import SwiftUI

struct HeartFlagView: View {
    let countryName: String
    
    var body: some View {
        Image(countryName)
            .resizable()
            .frame(width: 24, height: 27)
            .padding(8)
            .background(.blue)
            .clipShape(Circle())
    }
}

struct HeartFlagView_Previews: PreviewProvider {
    static var previews: some View {
        HeartFlagView(countryName: "belgium")
    }
}
