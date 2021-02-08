//
//  PokemonDetailViewReceiver.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation

protocol PokemonDetailViewReceiver: class {
    func showPokemonInfo(pokemonInfo: PokemonDetailInfo)
}
