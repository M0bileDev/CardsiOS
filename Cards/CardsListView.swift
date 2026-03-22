//
//  CardsListView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardsListView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.gray)
                        .frame(width: 150, height: 250)
                }
            }
        }
    }
}

#Preview {
    CardsListView()
}
