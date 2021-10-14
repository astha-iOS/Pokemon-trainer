//
//  Pokemon.swift
//  WefoxAssignment
//
//  Created by Astha yadav on 09/10/21.
//

import Foundation
import UIKit
import SwiftUI

struct Pokemon: Codable, Identifiable {
    var id : Int
    var name: String
    var weight: Int
    var height: Int
    var base_experience: Int
    var order:Int
    var sprites: Sprites
    var types:[types]
    
}

struct Sprites:Codable, Identifiable{
    let id = UUID()
 //   var id : Int
    var front_default:String
}

struct types:Codable,Identifiable{
    let id = UUID()
    var slot : Int
    var type : type
}

struct type:Codable,Identifiable{
    let id = UUID()
    var name : String
}



