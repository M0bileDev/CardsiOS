//
//  CardToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 02/04/2026.
//

import SwiftUI

struct CardToolbar: ViewModifier {

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: CardStore
    @Binding var currentModal: ToolbarSelection?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    @State private var frameIndex: Int?
    @State private var textElement: TextElement = TextElement()

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
                                        text: text
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

    private var bottomToolbarHeight: CGFloat {
        return if verticalSizeClass == .compact {
            50
        } else {
            70
        }
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
                    case .textModal:
                        TextModal(textElement: $textElement)
                            .onDisappear(perform: {
                                if !textElement.text.isEmpty {
                                    card.addElement(text: textElement.text)
                                    textElement = TextElement()
                                }
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
                ToolbarItem(
                    placement: .topBarLeading,
                    content: {
                        let uiImage = UIImage.screenshot(
                            card: card,
                            size: Settings.cardSize
                        )
                        let image = Image(uiImage: uiImage)
                        ShareLink(
                            // screen capture image
                            item: image,
                            preview: SharePreview(
                                "Card",
                                // preview image
                                image: image
                            )
                        ) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                )
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(
                        modal: $currentModal,
                        card: $card
                    )
                    .frame(
                        height: bottomToolbarHeight
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
