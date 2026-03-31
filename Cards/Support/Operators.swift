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
