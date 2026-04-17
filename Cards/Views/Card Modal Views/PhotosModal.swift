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
        ).onChange(
            of: selectedPhotos,
            { _, items in
                for item in items {
                    item.loadTransferable(type: Data.self) {
                        //Result<Success, Failure>
                        //Success contains the image data
                        //Failure contains a failure value
                        result in
                        //Task -> load the image on a background thread
                        Task {
                            switch result {
                            case .success(let data):
                                if let data,
                                    let uiImage = UIImage(data: data)
                                {
                                    await MainActor.run(body: {
                                        card.addElement(uiImage: uiImage)
                                    })
                                }
                            case .failure(let failure):
                                fatalError("Image transfer failed: \(failure)")
                            }

                        }
                    }
                }
                selectedPhotos = []
            }
        )
    }
}

#Preview {
    PhotosModal(card: .constant(Card()))
}
