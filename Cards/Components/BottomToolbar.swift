//
//  BottomToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct BottomToolbar: View {

    @EnvironmentObject var store: CardStore
    @Binding var modal: ToolbarSelection?
    @Binding var card: Card

    func defaultButton(_ selection: ToolbarSelection) -> some View {
        Button(
            action: {
                modal = selection
            },
            label: {
                ToolbarButton(modal: selection)
            }
        )
    }

    var body: some View {
        HStack {
            ForEach(
                ToolbarSelection.allCases,
                content: { selection in
                    switch selection {
                    case .photoModal:
                        Button {
                        } label: {
                            PhotosModal(card: $card)
                        }
                    case .frameModal:
                        defaultButton(selection)
                            .disabled(
                                store.selectedElement == nil
                                    || !(store.selectedElement is ImageElement)
                            )
                    default:
                        defaultButton(selection)
                    }
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
                    .frame(height: 35)
                Text(text)
            }
            .padding(.top)
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal), card: .constant(Card()))
        .environmentObject(CardStore())
}
