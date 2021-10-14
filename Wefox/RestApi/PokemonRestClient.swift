//
//  PokemonRestClient.swift
//  WefoxAssignment
//
//  Created by Astha yadav on 09/10/21.
//

import Foundation

class PokemonRestClient {
    
    static private let jsonDecoder = JSONDecoder()
    static var sharedInstance:PokemonRestClient {
        let instance = PokemonRestClient()
        return instance
    }

    func getPokemon(randomNumber:Int,completion:@escaping (Pokemon?,Error?) -> ()) {
        let url = URL(string: "\(BASE_URL)\(randomNumber)")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else{ return }
            
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil,"Client error!" as? Error)
                }
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                DispatchQueue.main.async {
                    completion(nil,"Server error!" as? Error)
                }
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                DispatchQueue.main.async {
                    completion(nil,"Wrong MIME type!" as? Error)
                }
                return
            }
            
            do{
                let result = try PokemonRestClient.jsonDecoder.decode(Pokemon.self, from: data)
                DispatchQueue.main.async {
                    completion(result,nil)
                }
            }
            catch{
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }

        }.resume()
        
    }
}
