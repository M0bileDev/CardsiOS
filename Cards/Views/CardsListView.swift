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
    //holds the identity of the current view
    @Namespace private var namespace

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
                        .matchedTransitionSource(id: card.id, in: namespace)
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

    private var createButton: some View {
        Button(
            action: {
                selectedCard = store.addCard()
            },
            label: {
                Label("Create card", systemImage: "plus")
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 10)
            }
        )
        .font(.system(size: 16, weight: .bold))
        .background(Color.bar)
        .accentColor(.white)
    }

    private var initialView: some View {
        VStack {
            let card = Card(
                backgroundColor: Color(
                    uiColor: .systemBackground
                )
            )
            ZStack {
                CardThumbnail(card: card)
                Image(
                    systemName: "plus.circle.fill",
                ).font(.largeTitle)
            }
            .onTapGesture {
                selectedCard = store.addCard()
            }
        }
        .frame(
            width: thumbnailSize.width * 1.2,
            height: thumbnailSize.height * 1.2
        )
        .padding(.bottom, 20)
    }

    var body: some View {
        VStack {
            list.fullScreenCover(
                item: $selectedCard,
                content: { card in
                    if let index = store.index(for: card) {
                        SingleCardView(card: $store.cards[index])
                            .navigationTransition(
                                .zoom(sourceID: card.id, in: namespace)
                            )
                    } else {
                        fatalError("Unable to locate selected card")
                    }
                }
            )
            .overlay(content: {
                if store.cards.isEmpty {
                    ContentUnavailableView {
                        initialView
                    } description: {
                        Text("Tap the plus button to add a card")
                    }
                }
            })
            createButton
        }
        .background(Color.background.ignoresSafeArea())

    }
}

#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: false))
}
