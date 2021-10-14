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
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.order, ascending: true)],predicate: NSPredicate(format: "id != %d", -1))
    private var pokemons: FetchedResults<Item>
    @State private var isActive = false
    
    var body: some View {
            List {
                ForEach(pokemons) { pokemonInfo in
                    NavigationLink(destination: DetailView(pokemonInfo:pokemonInfo)){
                    HStack{
                        Image(uiImage: (pokemonInfo.front_default?.loadImage())!)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .clipped()
                        .cornerRadius(10.0)
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading) {
                        Text(pokemonInfo.name ?? "N/A")
                            .font(.headline)
                            .colorScheme(.light)
                        }
                    }
                    }.navigationTitle(kNavTitle)
                        .navigationBarBackButtonHidden(true)
                                .navigationBarItems(leading:
                                    Button(action: {
                                        NavigationUtil.popToRootView()
                                    }){
                                        HStack {
                                            Image(systemName: "arrow.left")
                                            Text("Back")
                                        }
                                })
                }
            }
            
    }
        
}

struct BackPackView_Previews: PreviewProvider {
    static var previews: some View {
        BackPackView()
    }
}

