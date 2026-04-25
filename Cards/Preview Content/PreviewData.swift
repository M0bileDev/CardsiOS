//
//  PreviewData.swift
//  Cards
//
//  Created by Damian Ogórek on 02/04/2026.
//

import SwiftUI

var initialCards: [Card] { [
  Card(backgroundColor: .green, elements: initialElements),
  Card(backgroundColor: .orange),
  Card(backgroundColor: .red),
  Card(backgroundColor: .purple),
  Card(backgroundColor: .yellow)
] }

var initialElements: [CardElement] { [
  ImageElement(
    transform: Transform(
      size: CGSize(width: 250, height: 180),
      offset: CGSize(width: 27, height: -140)),
    uiImage: UIImage(named: "hedgehog1")),
  ImageElement(
    transform: Transform(
      size: CGSize(width: 380, height: 270),
      offset: CGSize(width: -80, height: 25)),
    uiImage: UIImage(named: "hedgehog2")),
  ImageElement(
    transform: Transform(
      size: CGSize(width: 250, height: 180),
      offset: CGSize(width: 80, height: 205)),
    uiImage: UIImage(named: "hedgehog3")),
  TextElement(
    transform: Transform(
      size: Settings.defaultElementSize * 1.1,
      offset: CGSize(width: 10, height: -275)),
    text: "Hedgehogs!!!",
    textColor: .black)
] }
