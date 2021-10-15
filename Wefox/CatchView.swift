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
    @State private var showingAlert = false
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
                    .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
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
                    Button(action: catchPokemon) {
                        Text(kCatchButtonTitle)
                            .fontWeight(.regular)
                            .font(.subheadline)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    }
                    Button(action: leavePokemon){
                        Text(kLeaveButtonTitle)
                            .fontWeight(.regular)
                            .font(.subheadline)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 40, trailing: 10))

            }.alert(isPresented: $showingAlert) {
                Alert(
                    title: Text(kAlert),
                    message: Text(kPokemonCaught),
                    dismissButton: .default(Text(kOK), action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                )
            }
    }
    
    //MARK:- Catch It
    private func catchPokemon() {
        if !(isExistPokemonAlredy(id: pokemon.id)){
            var typesNameArr = [String]()
            for type in pokemon.types{
                typesNameArr.append(type.type.name)
            }
            let typesNameStr = typesNameArr.joined(separator:",")

            isActive = true
            let newItem = Item(context: viewContext)
            newItem.id = Int16(pokemon.id)
            newItem.name = pokemon.name
            newItem.weight = Int16(pokemon.weight)
            newItem.height = Int16(pokemon.height)
            newItem.base_experience = Int16(pokemon.base_experience)
            newItem.front_default = pokemon.sprites.front_default
            newItem.order = Int16(pokemon.order)
            newItem.types = typesNameStr
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }else{
            showingAlert = true
        }
    }
    
    //MARK:- Leave It
    private func leavePokemon() {
        self.presentationMode.wrappedValue.dismiss()
    }

    func isExistPokemonAlredy(id: Int) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        let res = try! viewContext.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
    
}


struct CatchView_Previews: PreviewProvider {
    static var previews: some View {
        CatchView(pokemon: Pokemon(id: 1, name: "N/A", weight: 1, height: 1, base_experience: 1, order: 1, sprites: Sprites.init(front_default: ""), types: [types.init(slot: 1, type: type(name: "N/A"))]))
        
     //   CatchView(pokemon: Pokemon(id: 1, name: "", weight: 1, height: 1, base_experience: 1, order: 1, sprites: Sprites.init(front_default: "")))
    }
}
