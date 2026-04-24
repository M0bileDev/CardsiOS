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

    var body: some View {
        ZStack {
            card.backgroundColor
                .onTapGesture {
                    store.selectedElement = nil
                }
            ForEach(
                $card.elements,
                id: \.id,
                content: { $element in
                    CardElementView(element: element)
                        .border(
                            Settings.borderColor,
                            width: isSelected(element)
                                ? Settings.borderWidth : 0
                        )
                        .onTapGesture {
                            store.selectedElement = element
                        }
                        .elementContextMenu(card: $card, element: $element)
                        .resizableView(transform: $element.transform)
                        .frame(
                            width: element.transform.size.width,
                            height: element.transform.size.height
                        )
                        
                }
            )
        }
        .dropDestination(for: CustomTransfer.self) {
            items,
            location in
            print(location)
            Task {
                await MainActor.run {
                    card.addElements(from: items)
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

#Preview {
    @Previewable @State var card = initialCards[0]
    CardDetailView(card: $card).environmentObject(
        CardStore(defaultData: true)
    )
}
