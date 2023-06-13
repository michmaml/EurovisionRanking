//
//  CardLoadingView.swift
//  EurovisionRanking
//
//  Created by Michal Sekulski on 13/06/2023.
//

import SwiftUI
import Backpack_SwiftUI

struct CardLoadingView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    let dummyText = "thisisdummytext"
    var body: some View {
        let layout = dynamicTypeSize <= .xxxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        
        HStack {
            layout {
                Circle()
                    .frame(width: 24, height: 27)
                    .foregroundColor(BPKColor.textSecondaryColor)
                VStack(alignment: .leading) {
                    BPKText(dummyText, style: .footnote)
                        .redacted(reason: .placeholder)
                    BPKText(dummyText, style: .heading4)
                        .redacted(reason: .placeholder)
                }
                
                Spacer()
            }
            Spacer()
        }
        VStack {
            Rectangle()
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                .cornerRadius(10)
                .foregroundColor(BPKColor.textSecondaryColor)
        }.padding(.horizontal, 12)
        BPKButton("Choose", action: {})
    }
}

struct CardLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CardLoadingView()
    }
}
