//
//  SingleCardView.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

struct SingleCardView: View {

    @Environment(\.dismiss) var dismiss
    @State var currentModal: ToolbarSelection?

    var content: some View {
        ZStack {
            Group {
              Capsule()
                .foregroundStyle(.yellow)
              Text("Resize Me!")
                .fontWeight(.bold)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
            }
            .resizableView()
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }
    }

    var body: some View {
        NavigationStack {
            content
                .sheet(
                    item: $currentModal,
                    content: { item in
                        switch item {
                        default: Text(String(describing: item))
                        }
                    }
                )
                .toolbar(content: {
                    ToolbarItem(
                        placement: .topBarTrailing,
                        content: {
                            Button("Done") {
                                dismiss()
                            }
                        }
                    )
                    ToolbarItem(placement: .bottomBar) {
                        BottomToolbar(modal: $currentModal)
                    }
                })
        }
    }
}

#Preview {
    SingleCardView(currentModal: nil)
}
