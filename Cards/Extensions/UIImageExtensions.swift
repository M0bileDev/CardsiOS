//
//  UIImageExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 26/04/2026.
//

import SwiftUI

extension UIImage {
    static let minSize = CGSize(width: 300, height: 200)
    static let maxSize = CGSize(width: 1000, height: 1500)

    func resizeLargeImage() -> UIImage {
        let defaultSize: CGFloat = 1000
        if size.width <= defaultSize || size.height <= defaultSize {
            return self
        }

        let scale: CGFloat
        if size.width >= size.height {
            scale = defaultSize / size.width
        } else {
            scale = defaultSize / size.height
        }

        let newSize = CGSize(
            width: size.width * scale,
            height: size.height * scale
        )
        return resize(to: newSize)
    }

    func resize(to size: CGSize) -> UIImage {
        let imageRendererFormat = UIGraphicsImageRendererFormat()
        //100×100 means 100×100 pixels, no multiplier
        imageRendererFormat.scale = 1
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat)
            .image(actions: { _ in
                draw(in: CGRect(origin: .zero, size: size))
            })
    }
}
