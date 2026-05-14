//
//  CardThumbnail.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardThumbnail: View {

    let card: Card

    var body: some View {
        Group {
            let image = UIImage.load(name: card.id.uuidString)
            if image != UIImage.error {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                card.backgroundColor
            }
        }
        .cornerRadius(10)
        .shadow(
            color: .shadow,
            radius: 3,
            x: 0.0,
            y: 0.0
        )
    }
}

#Preview {
    CardThumbnail(card: initialCards[0])
        .frame(
            width: Settings.thumbnailSize.width,
            height: Settings.thumbnailSize.height
        )
}
