//
//  Shapes.swift
//  Cards
//
//  Created by Damian Ogórek on 22/04/2026.
//

import SwiftUI

#Preview {
    Triangle()
        .frame(width: 150, height: 150)
        .background(Color.yellow)
}

struct Triangle: Shape {
    //rect -> drawing canvas
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 20, y: 30))

        path.addLine(to: CGPoint(x: 130, y: 70))
        path.addLine(to: CGPoint(x: 60, y: 140))

        path.closeSubpath()

        return path
    }
}
