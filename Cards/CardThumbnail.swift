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
            .foregroundStyle(.gray)
            .frame(width: 150, height: 250)
    }
}

#Preview {
    CardThumbnail()
}
