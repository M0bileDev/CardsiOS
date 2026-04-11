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
                        .resizableView()
                        .frame(
                            width: element.transform.size.width,
                            height: element.transform.size.height
                        )
                }
            )
        }
    }
}

#Preview {
    CardDetailView(card: .constant(initialCards[0])).environmentObject(
        CardStore(defaultData: true)
    )
}
