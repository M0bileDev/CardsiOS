//
//  CardsListView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardsListView: View {

    @EnvironmentObject private var store: CardStore
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var selectedCard: Card?

    var thumbnailSize: CGSize {
        var scale: CGFloat = 1
        if verticalSizeClass == .regular,
            horizontalSizeClass == .regular
        {
            scale = 1.5
        }

        return Settings.thumbnailSize * scale
    }

    private var list: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 30) {
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
                        .frame(
                            width: thumbnailSize.width,
                            height: thumbnailSize.height
                        )
                }
            }
        }
        .padding(.top, 20)
    }

    private var columns: [GridItem] {
        [
            GridItem(
                .adaptive(minimum: thumbnailSize.width)
            )
        ]
    }

    var body: some View {
        VStack {
            list.fullScreenCover(
                item: $selectedCard,
                content: { card in
                    if let index = store.index(for: card) {
                        SingleCardView(card: $store.cards[index])
                    } else {
                        fatalError("Unable to locate selected card")
                    }
                }
            )
            Button("Add") {
                selectedCard = store.addCard()
            }
        }
        .background(Color.background.ignoresSafeArea())

    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}
