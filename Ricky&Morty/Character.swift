//
//  Character.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import Foundation

struct CharacterList: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let episode: [String]
    let origin: Location
    let location: Location
    let created: String
    
}


struct Location: Codable {
    let name: String
    let url: String
}
