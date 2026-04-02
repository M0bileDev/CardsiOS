//
//  Operators.swift
//  Cards
//
//  Created by Damian Ogórek on 31/03/2026.
//

import SwiftUI

func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width, height: left.height + right.height)
}

func * (left: CGSize, value: CGFloat) -> CGSize {
    CGSize(width: left.width * value, height: left.height * value)
}

func *= (left: inout CGSize, value: Double) {
    left = CGSize(
        width: left.width * value,
        height: left.height * value
    )
}

func / (left: CGSize, value: CGFloat) -> CGSize {
    CGSize(
        width: left.width / value,
        height: left.height / value
    )
}
