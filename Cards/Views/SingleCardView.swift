//
//  SingleCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct SingleCardView: View {

    let card: Card
    @Environment(\.dismiss) var dismiss
    @State var currentModal: ToolbarSelection?

    var content: some View {
        card.backgroundColor
    }

    var body: some View {
        NavigationStack {
            content.cardToolbar(modal: $currentModal)
        }
    }
}

#Preview {
    SingleCardView(card: initialCards[0], currentModal: nil)
}
