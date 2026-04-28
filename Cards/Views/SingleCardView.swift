//
//  SingleCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct SingleCardView: View {

    @Binding var card: Card
    @State private var currentModal: ToolbarSelection?
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        NavigationStack {
            CardDetailView(card: $card)
                .cardToolbar(modal: $currentModal, card: $card)
                .onDisappear(perform: {
                    card.save()
                })
                .onChange(
                    of: scenePhase,
                    { _, newScenePhase in
                        if newScenePhase == .inactive {
                            card.save()
                        }
                    }
                )
        }
    }
}

#Preview {
    @Previewable @State var card = initialCards[0]
    SingleCardView(card: $card)
        .environmentObject(CardStore(defaultData: true))
}
