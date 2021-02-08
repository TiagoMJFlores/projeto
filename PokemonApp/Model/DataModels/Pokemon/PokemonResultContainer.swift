//
//  PokemonBase.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation

struct PokemonResultContainer: Codable {
    let count: Int
    let next: String
    let results: [PokemonEntry]
}
