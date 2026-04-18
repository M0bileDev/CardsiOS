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
            ForEach(
                $card.elements,
                id: \.id,
                content: { $element in
                    CardElementView(element: element)
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
    }
}

#Preview {
    @Previewable @State var card = initialCards[0]
    CardDetailView(card: $card).environmentObject(
        CardStore(defaultData: true)
    )
}
