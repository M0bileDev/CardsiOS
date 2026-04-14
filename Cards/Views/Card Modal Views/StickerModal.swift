//
//  StickerModal.swift
//  Cards
//
//  Created by Damian Ogórek on 14/04/2026.
//

import SwiftUI

struct StickerModal: View {
    var body: some View {
        if let resourcePath = Bundle.main.resourcePath,
            let image = UIImage(
                named: resourcePath + "/Stickers/Camping/fire.png"
            )
        {
            Image(uiImage: image)
        } else {
            Image(.error)
        }
    }
}

#Preview {
    StickerModal()
}
