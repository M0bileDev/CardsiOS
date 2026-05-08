//
//  CardDetailView.swift
//  Cards
//
//  Created by Damian Ogórek on 11/04/2026.
//

import SwiftUI

struct CardDetailView: View {

    @EnvironmentObject var store: CardStore
    @Binding var card: Card
    var viewScale: CGFloat = 1.0

    var body: some View {

        card.backgroundColor
            .onTapGesture {
                store.selectedElement = nil
            }
            .overlay {
                ForEach(
                    $card.elements,
                    id: \.id,
                    content: { $element in
                        CardElementView(element: element)
                            .overlay(
                                element: element,
                                isSelected: isSelected(element)
                            )
                            .onTapGesture {
                                store.selectedElement = element
                            }
                            .elementContextMenu(card: $card, element: $element)
                            .resizableView(
                                transform: $element.transform,
                                viewScale: viewScale
                            )
                            .frame(
                                width: element.transform.size.width,
                                height: element.transform.size.height
                            )

                    }
                )
            }
            .clipped()
            .dropDestination(for: CustomTransfer.self) {
                items,
                location in
                let offset = Settings.calculateDropOffset(
                    viewScale: viewScale,
                    location: location
                )
                Task {
                    await MainActor.run {
                        card.addElements(from: items, offset: offset)
                    }
                }
                return !items.isEmpty
            }
            .onDisappear {
                store.selectedElement = nil
            }
    }

    func isSelected(_ element: CardElement) -> Bool {
        store.selectedElement?.id == element.id
    }

}

extension View {
    @ViewBuilder
    fileprivate func overlay(
        element: CardElement,
        isSelected: Bool
    ) -> some View {
        if isSelected,
            let element = element as? ImageElement,
            let frameIndex = element.frameIndex
        {
            let shape = Shapes.shapes[frameIndex]
            self.overlay(
                shape
                    .stroke(lineWidth: Settings.borderWidth)
                    .foregroundStyle(Settings.borderColor)
            )
        } else {
            self
                .border(
                    Settings.borderColor,
                    width: isSelected ? Settings.borderWidth : 0
                )
        }
    }
}

#Preview {
    @Previewable @State var card = initialCards[0]
    CardDetailView(card: $card).environmentObject(
        CardStore(defaultData: true)
    )
}
