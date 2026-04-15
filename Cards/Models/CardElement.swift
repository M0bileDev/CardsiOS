//
//  CardElement.swift
//  Cards
//
//  Created by Damian Ogórek on 04/04/2026.
//

import SwiftUI

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { set get }
}

extension CardElement{
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex{ $0.id == id}
    }
}

struct ImageElement: CardElement {
    var id: UUID = UUID()
    var transform: Transform = Transform()
    var uiImage: UIImage?
    var image: Image {
        Image(uiImage: uiImage ?? UIImage.error)
    }
}

struct TextElement: CardElement {
    var id: UUID = UUID()
    var transform: Transform = Transform()
    var text = ""
    var textColor: Color = .black
    var textFont = "Gill Sans"
}
