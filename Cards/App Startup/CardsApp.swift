//
//  CardsApp.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

@main
struct CardsApp: App {

    @StateObject var store = CardStore(defaultData: true)

    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .environmentObject(store)
        }
    }
}
