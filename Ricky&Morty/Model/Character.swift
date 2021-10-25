//
//  Character.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import Foundation

struct CharacterList: Codable {
    let results: [Character]
    let info: CharacterInfo
}

struct CharacterInfo: Codable{
    let pages: Int
    let next: String?
}

struct Character: Codable, Identifiable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: URL
    let episode: [String]
    let origin: Location
    let location: Location
    let created: String
    
}


struct Location: Codable {
    let name: String
    let url: String
}

struct Episode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

