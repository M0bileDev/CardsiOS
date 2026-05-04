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
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(card.backgroundColor)

    }
}

#Preview {
    CardThumbnail(card: initialCards[0])
        .frame(
            width: Settings.thumbnailSize.width,
            height: Settings.thumbnailSize.height
        )
}
