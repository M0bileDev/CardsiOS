//
//  PhotosModal.swift
//  Cards
//
//  Created by Damian Ogórek on 16/04/2026.
//

import PhotosUI
import SwiftUI

struct PhotosModal: View {

    @Binding var card: Card
    //an identifier and the type of content -> like .jpeg
    @State private var selectedPhotos: [PhotosPickerItem] = []

    var body: some View {
        PhotosPicker(
            //when selected will be added to array
            selection: $selectedPhotos,
            //the filter for images
            matching: .images,
            
            label: {
                ToolbarButton(modal: .photoModal)
            }
        )
    }
}

#Preview {
    PhotosModal(card: .constant(Card()))
}
