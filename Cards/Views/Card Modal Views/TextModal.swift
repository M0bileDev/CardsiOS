//
//  TextModal.swift
//  Cards
//
//  Created by Damian Ogórek on 02/05/2026.
//

import SwiftUI

struct TextModal: View {

    @Binding var textElement: TextElement
    @Environment(\.dismiss) var dismiss

    var body: some View {
        let onCommit = {
            dismiss()
        }

        TextField(
            "Enter text",
            text: $textElement.text,
            onCommit: onCommit
        )
    }
}

#Preview {
    TextModal(textElement: .constant(TextElement()))
}
