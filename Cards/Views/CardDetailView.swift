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
        .dropDestination(for: Data.self) {
            receivedData,
            location in
            print(location)
            for data in receivedData {
                if let image = UIImage(data: data) {
                    card.addElement(uiImage: image)
                }
            }
            return !receivedData.isEmpty
        }
    }
}

#Preview {
    @Previewable @State var card = initialCards[0]
    CardDetailView(card: $card).environmentObject(
        CardStore(defaultData: true)
    )
}
