//
//  Card.swift
//  Cards
//
//  Created by Damian Ogórek on 04/04/2026.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    mutating func addElement(uiImage: UIImage){
        let element = ImageElement(uiImage: uiImage)
        elements.append(element)
    }
    
    mutating func addElement(text: TextElement){
        elements.append(text)
    }
    
    
}
