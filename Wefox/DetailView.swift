//
//  DetailView.swift
//  Wefox
//
//  Created by Astha yadav on 13/10/21.
//

import SwiftUI
import CoreData
struct DetailView: View {
    
    var pokemonInfo : Item?
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 10){
                    Text(pokemonInfo?.name ?? "")
                        .font(.title)
                    Image(uiImage: (pokemonInfo?.front_default?.loadImage())!)
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical)
                        .frame(height: 250)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                    VStack(alignment: .leading,spacing: 10){
                        Text("Date added: \(pokemonInfo?.timestamp ?? Date())")
                            .font(.headline)
                        Text("Weight: \(pokemonInfo?.weight ?? 0)")
                            .font(.headline)
                        Text("Height: \(pokemonInfo?.height ?? 0)")
                            .font(.headline)
                        Text("Base experience: \(pokemonInfo?.base_experience ?? 0)")
                            .font(.headline)
                        Text("Type: \(pokemonInfo?.types ?? "N/A")")
                            .font(.headline)
                    }
                }
            }
    }
   
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
