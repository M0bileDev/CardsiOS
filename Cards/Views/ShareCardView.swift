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
        GeometryReader { proxy in
            scaledContent(size: proxy.size)
        }
    }

    func scaledContent(size: CGSize) -> some View {
        card.backgroundColor
            .overlay(content: {
                scaledElements(size: size)
            })
            .frame(
                width: Settings.calculateSize(size).width,
                height: Settings.calculateSize(size).height
            )
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
