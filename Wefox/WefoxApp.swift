//
//  WefoxApp.swift
//  Wefox
//
//  Created by Astha yadav on 12/10/21.
//

import SwiftUI

@main
struct WefoxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SearchView(pokemon: Pokemon(id: 1, name: "N/A", weight: 1, height: 1, base_experience: 1, order: 1, sprites: Sprites.init(front_default: ""), types: [types.init(slot: 1, type: type(name: "N/A"))])).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
