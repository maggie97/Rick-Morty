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
    /*let next: String?
    
    enum CodingKeys: String, CodingKey {
    case results, info, next
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([Character].self, forKey: .results)
        let infoContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .next)
        next = try infoContainer.decode(String?.self, forKey: .next)
    }
    
    init() {
        results = [Character]()
        next = nil
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
        var infoContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .info)
        try infoContainer.encode(next, forKey: .next)
    }*/
    
    
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
