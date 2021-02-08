//
//  PokemonDetailInfo.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation

struct PokemonDetailInfo: Codable {
    let types: [TypeElement]
    let sprites: Sprites
    let baseExperience: Int
    let height: Int
    let order: Int
    let weight: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case height
        case  name, order,  sprites,  types, weight
    }
}
    

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
    }

    init(backDefault: String,  frontDefault: String) {
        self.backDefault = backDefault
        self.frontDefault = frontDefault
    }
}


