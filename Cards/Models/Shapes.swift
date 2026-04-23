//
//  Shapes.swift
//  Cards
//
//  Created by Damian Ogórek on 22/04/2026.
//

import SwiftUI

#Preview(traits: .sizeThatFitsLayout) {
    Lens()
        .aspectRatio(1, contentMode: .fit)
        .background(Color.yellow)
}

struct Triangle: Shape {
    //rect -> drawing canvas
    func path(in rect: CGRect) -> Path {

        let width = rect.width
        let height = rect.height

        var path = Path()
        path.addLines(
            [
                CGPoint(x: width * 0.13, y: height * 0.2),
                CGPoint(x: width * 0.87, y: height * 0.47),
                CGPoint(x: width * 0.4, y: height * 0.93),
            ]
        )
        path.closeSubpath()

        return path
    }
}

struct Cone: Shape {
    func path(in rect: CGRect) -> Path {

        let radius = min(rect.midX, rect.midY)

        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: radius,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 180),
            clockwise: true
        )
        path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
        path.addLine(to: CGPoint(x: rect.midX + radius, y: rect.midY))
        path.closeSubpath()

        return path
    }

}

struct Lens: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY), control: CGPoint(x: rect.midX, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.midY), control: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }

}
