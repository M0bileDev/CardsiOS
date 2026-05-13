//
//  ListSelection.swift
//  Cards
//
//  Created by Damian Ogórek on 13/05/2026.
//

import SwiftUI

enum ListState {
    case list, carousel
}

struct ListSelection: View {

    @Binding var listState: ListState

    var body: some View {
        Picker(
            selection: $listState,
            content: {
                Image(systemName: "square.grid.2x2.fill").tag(ListState.list)
                Image(systemName: "rectangle.stack.fill").tag(
                    ListState.carousel
                )
            },
            label: {
                Text("")
            }
        )
        .pickerStyle(.segmented)
        .frame(width: 200)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListSelection(listState: .constant(.list))
}
