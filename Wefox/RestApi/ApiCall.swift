//
//  ApiCall.swift
//  WefoxAssignment
//
//  Created by Astha yadav on 09/10/21.
//

import Foundation

class ApiCall {

    func findPokemonApi(randomNumber:Int,completion:@escaping (Pokemon) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(randomNumber)") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{ return }
            
            if error != nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do{
                let result = try JSONDecoder().decode(Pokemon.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            catch{
                print("Error:",error.localizedDescription)
            }

        }.resume()
        
    }
    
    
}





