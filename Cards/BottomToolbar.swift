//
//  BottomToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct BottomToolbar: View {

    @Binding var modal: ToolbarSelection?

    var body: some View {
        HStack {
            ForEach(
                ToolbarSelection.allCases,
                id: \.self,
                content: { selection in
                    Button(
                        action: {
                            modal = selection
                        },
                        label: {
                            ToolbarButton(modal: selection)
                        }
                    )
                }
            )
        }
    }
}

struct ToolbarButton: View {
    private let modalButton:
        [ToolbarSelection: (text: String, imageName: String)] = [
            .photoModal: ("Photos", "photo"),
            .frameModal: ("Frames", "square.on.circle"),
            .stickerModal: ("Stickers", "heart.circle"),
            .textModal: ("Text", "textformat"),
        ]
    let modal: ToolbarSelection

    var body: some View {
        if let text = modalButton[modal]?.text,
            let imageName = modalButton[modal]?.imageName
        {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(text)
            }
            .padding(.top)
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal))
}
