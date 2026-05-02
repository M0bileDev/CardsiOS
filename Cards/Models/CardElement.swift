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

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}

struct ImageElement: CardElement {
    var id: UUID = UUID()
    var transform: Transform = Transform()
    var uiImage: UIImage?
    var image: Image {
        Image(uiImage: uiImage ?? UIImage.error)
    }
    var frameIndex: Int?
    var imageFilename: String?
}

extension ImageElement: Codable {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(
            keyedBy: ImageElementCodingKeys.self
        )
        transform = try container.decode(Transform.self, forKey: .transform)
        imageFilename = try container.decodeIfPresent(
            String.self,
            forKey: .imageFilename
        )
        frameIndex = try container.decodeIfPresent(
            Int.self,
            forKey: .frameIndex
        )

        if let imageFilename {
            uiImage = UIImage.load(name: imageFilename)
        } else {
            uiImage = UIImage.error
        }
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: ImageElementCodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(imageFilename, forKey: .imageFilename)
        try container.encode(frameIndex, forKey: .frameIndex)
    }
}

enum ImageElementCodingKeys: CodingKey {
    case transform, imageFilename, frameIndex
}

struct TextElement: CardElement {
    var id: UUID = UUID()
    var transform: Transform = Transform()
    var text = ""
    var textColor: Color = .black
    var textFont = "Gill Sans"
}

extension TextElement: Codable {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(
            keyedBy: TextElementCodingKeys.self
        )
        transform = try container.decode(Transform.self, forKey: .transform)
        text = try container.decode(String.self, forKey: .text)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: TextElementCodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(text, forKey: .text)
    }
}

enum TextElementCodingKeys: CodingKey {
    case text, transform
}
