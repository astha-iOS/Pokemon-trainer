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
            SearchView(model: Pokemon(id: 1, name: "", weight: 1, height: 1,base_experience: 1, order:1, sprites: Sprites.init(front_default: ""))).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
