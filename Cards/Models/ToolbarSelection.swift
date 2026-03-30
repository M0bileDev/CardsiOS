//
//  ToolbarSelection.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

enum ToolbarSelection : CaseIterable, Identifiable {
    var id: Int {
      hashValue
    }
    case photoModal, frameModal, stickerModal, textModal
}
