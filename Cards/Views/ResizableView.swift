//
//  ResizableView.swift
//  Cards
//
//  Created by Damian Ogórek on 30/03/2026.
//

import SwiftUI

struct ResizableView: View {

    private let content = RoundedRectangle(cornerRadius: 30.0)
    private let color = Color.red

    var body: some View {
        content
            .frame(width: 250, height: 180)
            .foregroundColor(color)
    }
}

#Preview {
    ResizableView()
}
