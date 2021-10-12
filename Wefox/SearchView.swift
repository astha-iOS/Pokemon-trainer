//
//  SearchView.swift
//  Wefox
//
//  Created by Astha yadav on 12/10/21.
//

import SwiftUI
import UIKit
import Foundation

struct SearchView: View {
    @State private var isActive = false
    @State public var model : Pokemon
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: CatchView(pokemon: model),isActive: $isActive){
                Button("Search",action:{
                    let number = Int.random(in: 0...1000)
                    ApiCall().findPokemonApi(randomNumber: number) { (result) in
                        model = result
                        isActive = true
                    }

                }).padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: BackPackView()){
                        Image("backpack")
                    }
                    
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(model: Pokemon(id: 1, name: "", weight: 1, height: 1, base_experience: 1, sprites: Sprites.init(front_default: "")))
    }
}
