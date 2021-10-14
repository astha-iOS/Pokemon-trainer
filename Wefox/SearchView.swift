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
    @State public var pokemon : Pokemon
    @State private var showingAlert = false
    @State private var errorMessage = String()
    
    var body: some View {
        NavigationView{
            ZStack { //UIScreen.main.bounds.width
                    Image(kSplaseLogo)
                    .resizable()
                    .frame(width:SCREEN_WIDTH, height: SCREEN_HEIGHT)
                    .aspectRatio(contentMode: .fit)
                    .background(Color.red)
            NavigationLink(destination: CatchView(pokemon: pokemon),isActive: $isActive){
                Button(kSearchButtonTitle,action:{
                    getPokemonApiCall()
                    
                }).padding(20)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .font(.title)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: BackPackView()){
                        Image(kBackpackLogo)
                    }
                    
                }
            }
        }
        }.alert(isPresented: $showingAlert) {
            Alert(
                title: Text(kAlert),
                message: Text(errorMessage),
                dismissButton: .default(Text(kOK), action: {
                    
                })
            )
        }
    }
    
    func randomNumber() -> Int{
        let number = Int.random(in: kNumberStart...kNumberEnd)
        return number
    }
    
    func getPokemonApiCall(){
        PokemonRestClient.sharedInstance.getPokemon(randomNumber: randomNumber()){ (result,error) in
            guard let result = result else{
                errorMessage = error?.localizedDescription ?? kError
                showingAlert = true
                return
            }
            pokemon = result
            isActive = true
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(pokemon: Pokemon(id: 1, name: "N/A", weight: 1, height: 1, base_experience: 1, order: 1, sprites: Sprites.init(front_default: ""), types: [types.init(slot: 1, type: type(name: "N/A"))]))
    }
}

