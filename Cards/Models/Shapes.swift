//
//  Shapes.swift
//  Cards
//
//  Created by Damian Ogórek on 22/04/2026.
//

import SwiftUI



#Preview {
    VStack{
        Rectangle()
        RoundedRectangle(cornerRadius: 25.0)
        Circle()
        Capsule()
        Ellipse()
    }
    .padding()
}

struct Triangle : Shape{
    //rect -> drawing canvas
    func path(in rect: CGRect) -> Path {
        var path = Path()
        return path
    }
    
    
}
