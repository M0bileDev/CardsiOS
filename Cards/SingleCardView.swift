//
//  SingleCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct SingleCardView: View {

    @Environment(\.dismiss) var dismiss
    @State var currentModal: ToolbarSelection?

    var body: some View {
        NavigationStack {
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
                    ToolbarItem(placement: .bottomBar) {
                      BottomToolbar(modal: $currentModal)
                    }
                })
        }
    }
}

#Preview {
    SingleCardView(currentModal: nil)
}
