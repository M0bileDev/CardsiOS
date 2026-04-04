//
//  CardStore.swift
//  Cards
//
//  Created by Damian Ogórek on 04/04/2026.
//

import SwiftUI
import Combine

class CardStore: ObservableObject {
  @Published var cards: [Card] = []
    
    init(defaultData: Bool = false) {
        if(defaultData){
            cards = initialCards
        }
    }
}
