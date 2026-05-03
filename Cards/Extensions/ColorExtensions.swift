//
//  ColorExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 01/04/2026.
//

import SwiftUI

extension Color {
    static let randomColors: [Color] = [
        .random1, .random2, .random3, .random4, .random5, .random6, .random7,
        .random8,
    ]

    static func random() -> Color {
        randomColors.randomElement() ?? .black
    }
}
