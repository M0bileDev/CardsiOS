//
//  AngleExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 29/04/2026.
//

import SwiftUI

extension Angle: Codable {
    public init(from decoder: Decoder) throws {
        //configure container to decode the data, same as encode
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let degrees = try container.decode(Double.self, forKey: .degrees)
        self.init(degrees: degrees)
    }

    public func encode(to encoder: Encoder) throws {
        //configure encoder by set its container
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(degrees, forKey: .degrees)
    }
}

enum CodingKeys: CodingKey {
    case degrees
}
