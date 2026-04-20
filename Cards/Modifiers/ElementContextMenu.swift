//
//  ElementContextMenu.swift
//  Cards
//
//  Created by Damian Ogórek on 20/04/2026.
//

import SwiftUI

struct ElementContextMenu : ViewModifier{
    
    @Binding var card: Card
    @Binding var element: CardElement
    
    func body(content: Content) -> some View {
        content
    }
}
