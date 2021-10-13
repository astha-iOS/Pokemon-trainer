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
    
    @Environment(\.managedObjectContext) private var viewContext

    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.order, ascending: true)],predicate: NSPredicate(format: "id != %d", -1))
    
    private var pokemonArray: FetchedResults<Item>
    private var pokemon_id: Int?
    @State private var isActive = false
    
    var body: some View {
            List {
                ForEach(pokemonArray) { pokemonInfo in
                    
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
                    }.navigationTitle("Pokédex")
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
    
//    func isExist(idd: Int) -> Bool {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
//        fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: idd)
//
//        let res = try! viewContext.fetch(fetchRequest)
//        return res.count > 0 ? true : false
//    }
    
}

struct BackPackView_Previews: PreviewProvider {
    static var previews: some View {
        BackPackView()
    }
}

