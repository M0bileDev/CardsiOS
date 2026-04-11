//
//  CardStore.swift
//  Cards
//
//  Created by Damian Ogórek on 04/04/2026.
//

import Combine
import SwiftUI

class CardStore: ObservableObject {
    @Published var cards: [Card] = []

    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }

    func index(for card: Card) -> Int? {
        cards.firstIndex { $0.id == card.id }
    }
}
