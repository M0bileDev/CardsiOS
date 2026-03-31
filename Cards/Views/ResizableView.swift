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
    @State private var previousRotation: Angle = .zero
    @State private var scale: CGFloat = 1.0

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }.onEnded { _ in
                previousOffset = transform.offset
            }
    }
    private var rotationGesture: some Gesture {
        RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }.onEnded { _ in
                previousRotation = .zero
            }
    }
    private var scaleGesture: some Gesture {
        MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }.onEnded{ scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0
            }
    }
    private let content = RoundedRectangle(cornerRadius: 30.0)
    private let color = Color.red

    var body: some View {
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .foregroundColor(color)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(rotationGesture)
    }
}

#Preview {
    ResizableView()
}
