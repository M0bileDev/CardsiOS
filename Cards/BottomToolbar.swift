//
//  BottomToolbar.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct BottomToolbar: View {
    
    @Binding var modal: ToolbarSelection?
    
    var body: some View {
        HStack{
            Button(action: {
                modal = .stickerModal
            }, label: {
                ToolbarButton()
            })
        }
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
    BottomToolbar(modal: .constant(.stickerModal))
}
