//
//  SplashScreen.swift
//  Cards
//
//  Created by Damian Ogórek on 11/05/2026.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            createCardView(letter: "S", color: "appColor1")
                .splashAnimation(finalYPosition: 240, delay: 0)
            createCardView(letter: "D", color: "appColor2")
                .splashAnimation(finalYPosition: 120, delay: 0.2)
            createCardView(letter: "R", color: "appColor3")
                .splashAnimation(finalYPosition: 0, delay: 0.4)
            createCardView(letter: "A", color: "appColor6")
                .splashAnimation(finalYPosition: -120, delay: 0.6)
            createCardView(letter: "C", color: "appColor7")
                .splashAnimation(finalYPosition: -240, delay: 0.8)

        }

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
                withAnimation(Animation.bouncy.delay(delay)) {
                    animating = false
                }
            }
    }
}

extension View {
    fileprivate func splashAnimation(
        finalYPosition: CGFloat,
        delay: Double
    ) -> some View {
        modifier(
            SplashAnimation(finalYPosition: finalYPosition, delay: delay)
        )
    }
}

#Preview {
    SplashScreen()
}
