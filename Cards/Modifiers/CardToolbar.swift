//
//  CardToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 02/04/2026.
//

import SwiftUI

struct CardToolbar: ViewModifier {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: CardStore
    @Binding var currentModal: ToolbarSelection?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    @State private var frameIndex: Int?

    var menu: some View {
        Menu(
            content: {
                Button(
                    action: {
                        if UIPasteboard.general.hasImages {
                            if let images = UIPasteboard.general.images {
                                for image in images {
                                    card.addElement(uiImage: image)
                                }
                            }
                        } else if UIPasteboard.general.hasStrings {
                            if let strings = UIPasteboard.general.strings {
                                for text in strings {
                                    card.addElement(
                                        text: TextElement(text: text)
                                    )
                                }
                            }
                        }
                    },
                    label: {
                        Label("Paste", systemImage: "doc.on.clipboard")
                    }
                )
                .disabled(
                    !UIPasteboard.general.hasImages
                        && !UIPasteboard.general.hasStrings
                )
            },
            label: {
                Label("Add", systemImage: "ellipsis.circle")
            }
        )

    }

    func body(content: Content) -> some View {
        content
            .sheet(
                item: $currentModal,
                content: { item in
                    switch item {
                    case .stickerModal:
                        StickerModal(
                            stickerImage: $stickerImage
                        ).onDisappear {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                    case .frameModal:
                        FrameModal(frameIndex: $frameIndex)
                            .onDisappear(perform: {
                                if let frameIndex {
                                    card.update(
                                        store.selectedElement,
                                        frameIndex: frameIndex
                                    )
                                }
                                frameIndex = nil
                            })
                    default: Text(String(describing: item))
                    }
                }
            )
            .toolbar(content: {
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        menu
                    }
                )
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        Button("Done") {
                            dismiss()
                        }
                    }
                )
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(
                        modal: $currentModal,
                        card: $card
                    )
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
        .environmentObject(CardStore(defaultData: true))
}

extension View {
    func cardToolbar(modal: Binding<ToolbarSelection?>, card: Binding<Card>)
        -> some View
    {
        modifier(CardToolbar(currentModal: modal, card: card))
    }
}
