//
//  Card.swift
//  Cards
//
//  Created by Damian Ogórek on 04/04/2026.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []

    mutating func addElement(uiImage: UIImage) {
        let imageFilename = uiImage.save()

        let element = ImageElement(
            uiImage: uiImage,
            imageFilename: imageFilename
        )
        elements.append(element)
    }

    mutating func addElement(text: TextElement) {
        elements.append(text)
    }

    mutating func addElements(from transfer: [CustomTransfer]) {
        for element in transfer {
            if let text = element.text {
                addElement(text: TextElement(text: text))
            } else if let image = element.image {
                addElement(uiImage: image)
            }
        }
    }

    mutating func remove(_ element: CardElement) {
        if let element = element as? ImageElement {
            UIImage.remove(name: element.imageFilename)
        }

        if let index = element.index(in: elements) {
            elements.remove(at: index)
        }
    }

    mutating func update(_ element: CardElement?, frameIndex: Int) {
        guard element is ImageElement,
            let index = element?.index(in: elements),
            var imageElement = elements[index] as? ImageElement
        else { return }

        imageElement.frameIndex = frameIndex
        elements[index] = imageElement
    }

    func save() {
        print("Saving data...")
    }
}

extension Card: Codable {

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: Card.CardCodingKeys.self)
        try container.encode(id.uuidString, forKey: .id)
        let imageElements: [ImageElement] = elements.compactMap {
            $0 as? ImageElement
        }
        try container.encode(imageElements, forKey: .imageElements)
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: Card.CardCodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: id) ?? UUID()
        elements += try container.decode(
            [ImageElement].self,
            forKey: .imageElements
        )
    }

    enum CardCodingKeys: CodingKey {
        case id, backgroundColor, imageElements, textElements
    }
}
