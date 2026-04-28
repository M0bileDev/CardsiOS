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
        Team.load()
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

    static func load() {
        let url = URL.documentsDirectory.appendingPathComponent("TeamData")
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let team = try decoder.decode(Team.self, from: data)
            print(team)
        } catch {
            print(error.localizedDescription)
        }
    }
}

let teamData = Team(
    names: ["John", "Rachel", "Anna", "Jake"],
    count: 4
)
