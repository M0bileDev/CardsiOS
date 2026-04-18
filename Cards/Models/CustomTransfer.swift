//
//  CustomTransfer.swift
//  Cards
//
//  Created by Damian Ogórek on 18/04/2026.
//

import SwiftUI
internal import UniformTypeIdentifiers

struct CustomTransfer: Transferable {

    var image: UIImage?
    var text: String?

    public static var transferRepresentation: some TransferRepresentation {

        DataRepresentation(importedContentType: .image) { data in
            let image = UIImage(data: data) ?? UIImage.error
            return CustomTransfer(image: image)
        }

        DataRepresentation(importedContentType: .text) { data in
            return CustomTransfer(text: "Dragged text")
        }
    }
}
