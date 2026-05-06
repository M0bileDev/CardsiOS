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
                // calculate the size of the card view
                    .frame(
                        width: Settings.calculateSize(proxy.size).width,
                        height: Settings.calculateSize(proxy.size).height
                    )
                // this will center the card view in the geometry reader
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }

        }
    }
}

#Preview {
    @Previewable @State var card = initialCards[0]
    SingleCardView(card: $card)
        .environmentObject(CardStore(defaultData: true))
}
