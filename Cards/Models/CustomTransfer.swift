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
            let docType = NSAttributedString.DocumentType.html
            let encoding = String.Encoding.utf8.rawValue
            guard let text = try? NSAttributedString(
                data: data,
                options: [
                    .documentType: docType,
                    .characterEncoding: encoding
                ],
                documentAttributes: nil
            )else{
                return CustomTransfer(text: nil)
            }
            return CustomTransfer(text: text.string)
        }
    }
}
