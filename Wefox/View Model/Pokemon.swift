//
//  Pokemon.swift
//  WefoxAssignment
//
//  Created by Astha yadav on 09/10/21.
//

import Foundation
import UIKit

struct Pokemon: Codable, Identifiable {
    var id : Int
    var name: String
    var weight: Int
    var height: Int
    var base_experience: Int
    var sprites: Sprites
    
}

struct Sprites:Codable, Identifiable{
    let id = UUID()
    var front_default:String
}
