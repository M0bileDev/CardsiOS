//
//  TextView.swift
//  Cards
//
//  Created by Damian Ogórek on 09/05/2026.
//

import SwiftUI

struct TextView: View {

    @Binding var color: Color
    @Binding var font: String

    var colorSelector: some View {
        ForEach(1..<8) { index in
            let currentColor = Color("appColor\(index)")

            ZStack {
                Circle()
                    .stroke(Color.white, lineWidth: 1.0)
                    .overlay(content: {
                        Circle()
                            .foregroundStyle(
                                color == currentColor ? currentColor : .white
                            )
                    })
                    .frame(
                        width: 44,
                        height: 44
                    )
                Circle()
                    .stroke(lineWidth: color == currentColor ? 0 : 1)
                    .overlay(content: {
                        Circle()
                            .foregroundStyle(currentColor)
                    })
                    .frame(
                        width: color == currentColor ? 50 : 40,
                        height: color == currentColor ? 50 : 40
                    )
            }
            .onTapGesture {
                withAnimation {
                    color = Color("appColor\(index)")
                }
            }
        }
    }

    var fontsSelector: some View {
        ForEach(0..<AppFonts.fonts.count, id: \.self) { index in
            ZStack {
                Circle()
                    .foregroundStyle(.primary)
                    .colorInvert()
                Text("Aa")
                    .font(.custom(AppFonts.fonts[index], size: 20))
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
            }
            .frame(
                width: AppFonts.fonts[index] == font ? 50 : 40,
                height: AppFonts.fonts[index] == font ? 50 : 40
            )
            .onTapGesture {
                withAnimation {
                    font = AppFonts.fonts[index]
                }
            }
        }
    }

    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TextView()
}
