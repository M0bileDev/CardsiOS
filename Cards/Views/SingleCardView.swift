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
            GeometryReader { proxy in
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
                    .frame(
                        width: Settings.cardSize.width,
                        height: Settings.cardSize.height
                    )
                    .scaleEffect(0.8)
            }

        }
    }
}

#Preview {
    @Previewable @State var card = initialCards[0]
    SingleCardView(card: $card)
        .environmentObject(CardStore(defaultData: true))
}
