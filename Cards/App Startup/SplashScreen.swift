//
//  SplashScreen.swift
//  Cards
//
//  Created by Damian Ogórek on 11/05/2026.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        createCardView(letter: "C", color: "appColor7")
    }
}

func createCardView(letter: String, color: String) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 25)
            .shadow(radius: 3)
            .frame(
                width: 120,
                height: 160
            )
            .foregroundStyle(.white)
        Text(
            letter
        )
        .fontWeight(.bold)
        .scalableText()
        .foregroundStyle(Color(color))
        .frame(width: 80)
    }
}

private struct SplashAnimation: ViewModifier {
    @State private var animating = true
    let finalYPosition: CGFloat
    let delay: Double

    func body(content: Content) -> some View {
        content
            .offset(y: animating ? -700 : finalYPosition)
            .onAppear {
                animating = false
            }
    }
}

#Preview {
    SplashScreen()
}
