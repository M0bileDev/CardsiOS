//
//  ColorExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 01/04/2026.
//

import SwiftUI

extension Color {
    static let colors: [Color] = [
        .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple,
    ]
    static func random() -> Color{
        colors.randomElement() ?? .black
    }
}
