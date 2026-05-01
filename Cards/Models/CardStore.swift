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
    @Published var selectedElement: CardElement?

    init(defaultData: Bool = false) {
        cards = defaultData ? initialCards : load()
    }

    func index(for card: Card) -> Int? {
        cards.firstIndex { $0.id == card.id }
    }

    func remove(_ card: Card) {
        if let index = index(for: card) {
            cards.remove(at: index)
        }
    }
}

extension CardStore {
    func load() -> [Card] {
        var cards: [Card] = []

        let path = URL.documentsDirectory.path
        guard let enumerator = FileManager.default.enumerator(atPath: path),
            let files = enumerator.allObjects as? [String]
        else { return cards }

        let cardFiles = files.filter { $0.contains(".card") }
        for cardFile in cardFiles {
            do {
                let path = path + "/" + cardFile
                let data = try Data(contentsOf: URL(fileURLWithPath: path))

                let decoder = JSONDecoder()
                let card = try decoder.decode(Card.self, from: data)
                cards.append(card)
            } catch {
                print("Error: ", error.localizedDescription)
            }
        }

        return cards
    }
}
