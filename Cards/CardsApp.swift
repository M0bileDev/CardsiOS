//
//  CardsApp.swift
//  Cards
//
//  Created by Damian Ogórek on 22/03/2026.
//

import SwiftUI

@main
struct CardsApp: App {

    init() {
        Team.save()
    }

    @StateObject var store = CardStore(defaultData: true)

    var body: some Scene {
        WindowGroup {
            CardsListView()
                .environmentObject(store)
        }
    }
}

struct Team: Codable {
    let names: [String]
    let count: Int

    static func save() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(teamData)
            let url = URL.documentsDirectory.appendingPathComponent("TeamData")
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
}

let teamData = Team(
    names: ["John", "Rachel", "Anna", "Jake"],
    count: 4
)
