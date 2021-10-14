//
//  ApiCall.swift
//  WefoxAssignment
//
//  Created by Astha yadav on 09/10/21.
//

import Foundation

class RestClient: NSObject {
    
    static var sharedInstance:RestClient {
        let instance = RestClient()
        return instance
    }

    func findPokemonApi(randomNumber:Int,completion:@escaping (Pokemon?,Error?) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(1)") else {
            print("Invalid url...")
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{ return }
            
            if error != nil {
                print("Client error!")
                DispatchQueue.main.async {
                    completion(nil,"Client error!" as? Error)
                }
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                DispatchQueue.main.async {
                    completion(nil,"Server error!" as? Error)
                }
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                DispatchQueue.main.async {
                    completion(nil,"Wrong MIME type!" as? Error)
                }
                return
            }
            
            do{
                let result = try JSONDecoder().decode(Pokemon.self, from: data)
                DispatchQueue.main.async {
                    completion(result,nil)
                }
            }
            catch{
                print("Error:",error.localizedDescription)
                DispatchQueue.main.async {
                    completion(nil,error.localizedDescription as? Error)
                }
            }

        }.resume()
        
    }
    
    
}





