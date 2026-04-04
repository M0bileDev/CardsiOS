//
//  CardElement.swift
//  Cards
//
//  Created by Damian Ogórek on 04/04/2026.
//

import SwiftUI

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { set get }
}
