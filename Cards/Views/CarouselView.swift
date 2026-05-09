//
//  CarouselView.swift
//  Cards
//
//  Created by Damian Ogórek on 09/05/2026.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
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
