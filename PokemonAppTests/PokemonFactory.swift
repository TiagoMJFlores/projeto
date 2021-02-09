//
//  PokemonFactory.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 08/02/2021.
//

import Foundation
@testable import PokemonApp

class PokemonFactory {
    
    static func makePokemonDetailInfo(frontDefault: String = "") -> PokemonDetailInfo {
        return PokemonDetailInfo(types: [], sprites: Sprites(backDefault: "", frontDefault: frontDefault), baseExperience: 100, height: 100, order: 100, weight: 100, name: "test")
    }
 
    static func makePokemonEntry(name: String = "", url: String = "") -> PokemonEntry {
        return PokemonEntry(name: name, url: url)
    }
}
