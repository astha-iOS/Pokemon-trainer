//
//  PokemonDetailView.swift
//  Wefox
//
//  Created by Astha yadav on 12/10/21.
//

import SwiftUI

struct PokemonDetailView: View {
    
 //   var obj : product
    
    var body: some View {
        
        VStack{
            Image("") //pokemon.sprites.front_default
                .resizable()
                .frame(height: 300)
                .clipped()
                .cornerRadius(10.0)
                .background(Color.gray)
              //  .aspectRatio(contentMode: .fit)
                
            VStack(alignment: .leading) {
                Text("N/A")
                    .font(.headline)
                    .colorScheme(.light)
                Text("Weight:")
                    .font(.subheadline)
                }
            }.ignoresSafeArea(edges: .top)

        }
    
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}
