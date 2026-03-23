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
    private let modalButton : [
        ToolbarSelection: (text:String, imageName:String)
    ] = [
        .photoModal: ("Photos","photo"),
        .frameModal: ("Frames","square.on.circle"),
        .stickerModal: ("Stickers","heart.circle"),
        .textModal: ("Text","textFormat")
    ]
    let modal: ToolbarSelection
    
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
