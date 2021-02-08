//
//  PokemonDetailPresenterProtocols.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation

typealias PokemonDetailPresenterProtocol = PokemonDetailDatasource & PokemonDetailDelegate

protocol PokemonDetailDatasource {
    var pokemonEntry: PokemonEntry {get}
    
    func fetchPokemonData( callback: @escaping (PokemonDetailInfo) -> Void) 
    func numberItems() -> Int
    func item(at indexPath: IndexPath) -> (caption: String, value: String)?
}

protocol PokemonDetailDelegate {
    func viewLayerLoaded()
}
