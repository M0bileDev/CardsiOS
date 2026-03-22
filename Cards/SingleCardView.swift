//
//  SingleCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct SingleCardView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Color.yellow
            .toolbar(content: {
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        Button("Done") {
                            dismiss()
                        }
                    }
                )
            })
    }
}

#Preview {
    SingleCardView()
}
