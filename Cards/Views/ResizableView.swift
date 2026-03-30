//
//  ResizableView.swift
//  Cards
//
//  Created by Damian Ogórek on 30/03/2026.
//

import SwiftUI

struct ResizableView: View {

    @State private var transform = Transform()
    @State private var previousOffset: CGSize = .zero

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = CGSize(
                    width: value.translation.width + previousOffset.width,
                    height: value.translation.height + previousOffset.height
                )
            }.onEnded { _ in
                previousOffset = transform.offset
            }
    }
    private let content = RoundedRectangle(cornerRadius: 30.0)
    private let color = Color.red

    var body: some View {
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .foregroundColor(color)
            .offset(transform.offset)
            .gesture(dragGesture)
    }
}

#Preview {
    ResizableView()
}
