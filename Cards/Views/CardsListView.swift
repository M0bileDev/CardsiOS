//
//  CardsListView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardsListView: View {

    @State private var isPresented: Bool = false
    @EnvironmentObject private var store: CardStore

    private var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnail()
                        .onTapGesture {
                            isPresented.toggle()
                        }
                }
            }
        }
    }

    var body: some View {
        list.fullScreenCover(
            isPresented: $isPresented,
            content: {
                SingleCardView()
            }
        )
    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}
