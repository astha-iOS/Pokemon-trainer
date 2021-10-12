//
//  CatchView.swift
//  Wefox
//
//  Created by Astha yadav on 12/10/21.
//

import SwiftUI
import UIKit
import Foundation
import CoreData

struct CatchView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State private var isActive = false
     
    let pokemon:Pokemon
    
    var body: some View {
            VStack(spacing: 30){
                Text(pokemon.name)
                    .font(.title)
                Image(uiImage: pokemon.sprites.front_default.loadImage())
                    .resizable()
                    .frame(width: 350, height: 250, alignment: .top)
                    .clipped()
                    .cornerRadius(10.0)
                    .background(Color.gray)
                    .aspectRatio(contentMode: .fit)

                VStack(alignment: .leading,spacing: 10) {
                    Text("weight of pockeman: \(pokemon.weight)")
                        .font(.subheadline)
                        .colorScheme(.light)
                 
                    Text("height of pockeman: \(pokemon.height)")
                        .font(.subheadline)
                    }
              
                HStack(spacing:30){
                    NavigationLink(destination: BackPackView(),isActive: $isActive){
                    Button(action: catchIt) {
                        Text("Catch it")
                            .fontWeight(.regular)
                            .font(.subheadline)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    }
                    Button(action: leaveIt){
                        Text("Leave it")
                            .fontWeight(.regular)
                            .font(.subheadline)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 40, trailing: 10))

            }
    }
    
    //MARK:- Catch It
    private func catchIt() {
        isActive = true
        let newItem = Item(context: viewContext)
        newItem.id = Int16(pokemon.id)
        newItem.name = pokemon.name
        newItem.weight = Int16(pokemon.weight)
        newItem.height = Int16(pokemon.height)
        newItem.base_experience = Int16(pokemon.base_experience)
        newItem.front_default = pokemon.sprites.front_default
        do {
            try viewContext.save()
            print("catch pokemon.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK:- Leave It
    private func leaveIt() {
        self.presentationMode.wrappedValue.dismiss()
    }
}


struct CatchView_Previews: PreviewProvider {
    static var previews: some View {
        CatchView(pokemon: Pokemon(id: 1, name: "", weight: 1, height: 1, base_experience: 1, sprites: Sprites.init(front_default: "")))
    }
}
