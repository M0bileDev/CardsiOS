//
//  Settings.swift
//  Cards
//
//  Created by Damian Ogórek on 01/04/2026.
//

import SwiftUI

enum Settings {
    static let cardSize = CGSize(width: 1300, height: 2000)
    static let thumbnailSize = CGSize(width: 150, height: 250)
    static let defaultElementSize = CGSize(width: 800, height: 800)
    static let borderColor: Color = .blue
    static let borderWidth: CGFloat = 5
}

extension Settings {
    static func calculateDropOffset(
        viewScale: CGFloat,
        location: CGPoint
    ) -> CGSize {
        // convert the coordinates to the original (unscaled) card size
        let originalX = location.x / viewScale
        let originalY = location.y / viewScale

        //calculate the offset to center of the image on the drop location
        let offset = CGSize(
            // adjust by subtracting half of the original card size
            width: originalX - (Settings.cardSize.width * 0.5),
            height: originalY - (Settings.cardSize.height * 0.5)
        )

        return offset
    }

    static func calculateSize(_ size: CGSize) -> CGSize {
        var newSize = size
        let ratio = Settings.cardSize.width / Settings.cardSize.height

        if size.width < size.height {
            newSize.height = min(size.height, newSize.width / ratio)
            newSize.width = min(size.width, newSize.height * ratio)
        } else {
            newSize.width = min(size.width, newSize.height * ratio)
            newSize.height = min(size.height, newSize.width / ratio)
        }

        return newSize
    }

    static func calculateScale(_ size: CGSize) -> CGFloat {
        let newSize = calculateSize(size)
        return newSize.width / Settings.cardSize.width
    }
}
