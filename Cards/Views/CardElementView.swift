//
//  CardElementView.swift
//  Cards
//
//  Created by Damian Ogórek on 11/04/2026.
//

import SwiftUI

struct CardElementView: View {
    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CardElementView()
}

struct ImageElementView: View {

    let element: ImageElement

    var body: some View {
        element
            .image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct TextElementView: View {
    
    let element: TextElement
    
    var body: some View {
        if !element.text.isEmpty{
            Text(element.text)
                .font(.custom(element.textFont, size: 200))
                .foregroundStyle(element.textColor)
                .scalableText()
        }
    }
}
