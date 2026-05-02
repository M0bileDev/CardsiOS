//
//  TextModal.swift
//  Cards
//
//  Created by Damian Ogórek on 02/05/2026.
//

import SwiftUI

struct TextModal: View {

    @Binding var textElement: TextElement

    var body: some View {}
}

#Preview {
    TextModal(textElement: .constant(TextElement()))
}
