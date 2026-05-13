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
                .onAppear {
                    withAnimation(.linear(duration: 1.5)) {
                        showSplash = false
                    }
                }
        } else {
            CardsListView()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: Edge.trailing),
                        removal: .scale
                    )
                )
        }
    }
}

#Preview {
    AppLoadingView()
        .environmentObject(
            CardStore(defaultData: true)
        )
}
