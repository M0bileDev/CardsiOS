//
//  TextExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 02/04/2026.
//

import SwiftUI

extension Text {
    func scalableText(font: Font = Font.system(size: 1000)) -> some View {
        self
            .font(font)
            .minimumScaleFactor(0.01)
            .lineLimit(1)
    }
}
