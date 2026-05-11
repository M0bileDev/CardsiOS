//
//  AppLoadingView.swift
//  Cards
//
//  Created by Damian Ogórek on 11/05/2026.
//

import SwiftUI

struct AppLoadingView: View {

    @State private var showSplash = true

    var body: some View {
        if showSplash {
            SplashScreen()
                .ignoresSafeArea()
        } else {
            CardsListView()
        }
    }
}

#Preview {
    AppLoadingView()
        .environmentObject(
          CardStore(defaultData: true))
}
