//
//  CardsApp.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

@main
struct CardsApp: App {

    @StateObject var store = CardStore(defaultData: false)

    var body: some Scene {
        WindowGroup {
            CardsListView()
                .environmentObject(store)
        }
    }
}
