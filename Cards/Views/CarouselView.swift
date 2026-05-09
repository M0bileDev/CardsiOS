//
//  CarouselView.swift
//  Cards
//
//  Created by Damian Ogórek on 09/05/2026.
//

import SwiftUI

struct CarouselView: View {

    @EnvironmentObject var store: CardStore
    @Binding var selectedCard: Card?
    let thumbnailScale: CGFloat = 0.7

    var body: some View {
        GeometryReader { proxy in
            TabView(content: {
                ForEach((0..<store.cards.count), id: \.self) { index in
                    getOrCreateCardView(card: store.cards[index])
                        .frame(
                            width: getCardSize(proxySize: proxy.size).width,
                            height: getCardSize(proxySize: proxy.size).height
                        )
                        .cornerRadius(15)
                        .shadow(
                            color: Color(white: 0.5, opacity: 0.7),
                            radius: 5
                        )
                        .onTapGesture(perform: {
                            selectedCard = store.cards[index]
                        })
                        .offset(y: -proxy.size.height * 0.05)
                }
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle())
        }
    }

    func getCardSize(proxySize: CGSize) -> CGSize {
        let cardSzie = Settings.calculateSize(proxySize)
        return cardSzie * thumbnailScale
    }

    func getOrCreateCardView(card: Card) -> some View {
        Group {
            if let image = loadCardImage(card: card) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                card.backgroundColor
            }
        }
    }

    func loadCardImage(card: Card) -> Image? {
        let uiImage = UIImage.load(name: card.id.uuidString)
        if uiImage != .error {
            return Image(uiImage: uiImage)
        }
        return nil
    }
}

#Preview {
    CarouselView()
}
