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
        card.backgroundColor
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
