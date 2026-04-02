//
//  CardToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 02/04/2026.
//

import SwiftUI

struct CardToolbar: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    @Binding var currentModal: ToolbarSelection?
    
    func body(content: Content) -> some View{
        content
            .sheet(
                item: $currentModal,
                content: { item in
                    switch item {
                    default: Text(String(describing: item))
                    }
                }
            )
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

extension View {
    func cardToolbar(modal: Binding<ToolbarSelection?>) -> some View {
        modifier(CardToolbar(currentModal: modal))
    }
}

//#Preview {
//    CardToolbar()
//}
