//
//  UIImageExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 26/04/2026.
//

import SwiftUI

extension UIImage {

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
