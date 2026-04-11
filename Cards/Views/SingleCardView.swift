//
//  SingleCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct SingleCardView: View {

    @Binding var card: Card
    @Environment(\.dismiss) var dismiss
    @State var currentModal: ToolbarSelection?

    var body: some View {
        NavigationStack {
            CardDetailView(card: $card).cardToolbar(modal: $currentModal)
        }
    }
}

#Preview {
    SingleCardView(card: .constant(initialCards[0]), currentModal: nil)
}
