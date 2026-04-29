//
//  Transform.swift
//  Cards
//
//  Created by Damian Ogórek on 30/03/2026.
//

import SwiftUI

struct Transform {
    var size = CGSize(
        width: Settings.defaultElementSize.width,
        height: Settings.defaultElementSize.height
    )
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}

extension Transform : Codable {}
