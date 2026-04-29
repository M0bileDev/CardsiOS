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
