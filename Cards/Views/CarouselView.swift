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
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
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
