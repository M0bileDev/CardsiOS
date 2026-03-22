//
//  BottomToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct BottomToolbar: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ToolbarButton: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.circle")
                .font(.largeTitle)
            Text("Stickers")
        }
        .padding(.top)
    }
}

#Preview {
    BottomToolbar()
}
