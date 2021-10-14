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
    @State private var showingAlert = false
    @State private var errorMessage = String()
    
    var body: some View {
        
        NavigationView{
            ZStack {
                    Image("Bg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .aspectRatio(contentMode: .fit)
                    .background(Color.red)
            NavigationLink(destination: CatchView(pokemon: model),isActive: $isActive){
                Button("Search",action:{
                    let number = Int.random(in: 0...1000)
                    RestClient.sharedInstance.findPokemonApi(randomNumber: number) { (result,error) in
                        guard let result = result else{
                            errorMessage = error as? String ?? ""
                            showingAlert = true
                            return
                        }
                        model = result
                        isActive = true
                    }

                }).padding(20)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .font(.title)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: BackPackView()){
                        Image("backpack")
                    }
                    
                }
            }
        } // zstack
        }.alert(isPresented: $showingAlert) {
            Alert(
                title: Text("AlERT"),
                message: Text(errorMessage),
                dismissButton: .default(Text("OK"), action: {
                    
                })
            )
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(model: Pokemon(id: 1, name: "N/A", weight: 1, height: 1, base_experience: 1, order: 1, sprites: Sprites.init(front_default: "")))
    }
}

