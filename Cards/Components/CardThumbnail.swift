//
//  CardThumbnail.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardThumbnail: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.random())
            .frame(
                width: Settings.thumbnailSize.width,
                height: Settings.thumbnailSize.height
            )
    }
}

#Preview {
    CardThumbnail()
}
