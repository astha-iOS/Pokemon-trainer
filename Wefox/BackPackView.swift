//
//  BackPackView.swift
//  Wefox
//
//  Created by Astha yadav on 12/10/21.
//

import SwiftUI
import UIKit
import Foundation
import CoreData

struct BackPackView: View {

    @FetchRequest(entity: Item.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id != %d", -1))

    private var pokemons: FetchedResults<Item>
    
    @State private var isActive = false
    
    var body: some View {
            List {
                ForEach(pokemons) { pokemon in
                    NavigationLink(destination: PokemonDetailView()){
                    HStack{
                        Image(uiImage: (pokemon.front_default?.loadImage())!)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipped()
                        .cornerRadius(10.0)
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading) {
                        Text(pokemon.name ?? "N/A")
                            .font(.headline)
                            .colorScheme(.light)
                        Text("Weight: \(pokemon.weight)")
                            .font(.subheadline)
                        }
                    }
                    }.navigationTitle("Pokédex")
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: searchNew) {
                        Label("search", systemImage: "magnifyingglass")
                    }
                }
                
            }
    }
    
    private func searchNew() {
        self.isActive = false
        NavigationUtil.popToRootView()
    }
}

struct BackPackView_Previews: PreviewProvider {
    static var previews: some View {
        BackPackView()
    }
}
