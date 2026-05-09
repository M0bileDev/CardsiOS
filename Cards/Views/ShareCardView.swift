//
//  ShareCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 09/05/2026.
//

import SwiftUI

struct ShareCardView: View {

    let card: Card

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }

    func scaledElements(size: CGSize) -> some View {
        let viewScale = Settings.calculateScale(size)
        return ForEach(card.elements, id: \.id) { element in
            CardElementView(element: element)
                .frame(
                    width: element.transform.size.width,
                    height: element.transform.size.height
                )
                .rotationEffect(element.transform.rotation)
                .scaleEffect(viewScale)
                .offset(element.transform.offset * viewScale)
        }
    }
}

//#Preview {
//    ShareCardView()
//}
