//
//  CardToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 02/04/2026.
//

import SwiftUI

struct CardToolbar: ViewModifier {

    @Environment(\.dismiss) var dismiss
    @Binding var currentModal: ToolbarSelection?
    @Binding var card: Card
    @State private var stickerImage: UIImage?

    func body(content: Content) -> some View {
        content
            .sheet(
                item: $currentModal,
                content: { item in
                    switch item {
                    case .stickerModal: StickerModal(
                        stickerImage: $stickerImage
                    ).onDisappear{
                        if let stickerImage = stickerImage{
                            card.addElement(uiImage: stickerImage)
                        }
                        stickerImage = nil
                    }
                    default: Text(String(describing: item))
                    }
                }
            )
            .toolbar(content: {
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        Button("Done") {
                            dismiss()
                        }
                    }
                )
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(modal: $currentModal)
                }
            })
    }
}

#Preview {
    Color.yellow
        .modifier(
            CardToolbar(
                currentModal: .constant(nil),
                card: .constant(Card())
            )
        )
}

extension View {
    func cardToolbar(modal: Binding<ToolbarSelection?>, card: Binding<Card>) -> some View {
        modifier(CardToolbar(currentModal: modal, card: card))
    }
}
