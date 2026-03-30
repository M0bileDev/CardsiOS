//
//  CardsListView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct CardsListView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnail()
                        .onTapGesture {
                            isPresented.toggle()
                        }
                }
            }
        }.fullScreenCover(isPresented: $isPresented, content: {
            SingleCardView()
        })
    }
}

#Preview {
    CardsListView()
}
