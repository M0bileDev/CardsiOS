//
//  CardsListView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardsListView: View {

    @EnvironmentObject private var store: CardStore
    @State private var selectedCard: Card?

    private var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .contextMenu {
                            Button(
                                role: .destructive,
                                action: {
                                    Task {
                                        store.remove(card)
                                    }
                                },
                                label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            )
                        }
                        .onTapGesture {
                            selectedCard = card
                        }
                }
            }
        }
    }

    var body: some View {
        list.fullScreenCover(
            item: $selectedCard,
            content: { card in
                if let index = store.index(for: card) {
                    SingleCardView(card: $store.cards[index])
                } else {
                    fatalError("Unable to locate selected card")
                }
            }
        ).onAppear {
            print(URL.documentsDirectory)
          }
    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}
