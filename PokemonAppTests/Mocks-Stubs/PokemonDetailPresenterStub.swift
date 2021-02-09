//
//  PokemonDetailPresenterMock.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 07/02/2021.
//

import Foundation
@testable import PokemonApp

class PokemonDetailPresenterStub {
    var pokemonEntry: PokemonEntry
    var pokemonDetailInfo: PokemonDetailInfo
    init(pokemonEntry: PokemonEntry, pokemonDetailInfo: PokemonDetailInfo) {
        self.pokemonEntry = pokemonEntry
        self.pokemonDetailInfo = pokemonDetailInfo
    }
}

extension PokemonDetailPresenterStub: PokemonDetailDatasource {

   
    func fetchPokemonData(callback: @escaping (PokemonDetailInfo) -> Void) {
        callback(pokemonDetailInfo)
    }
    
    func numberItems() -> Int {
        return 0
    }
    
    func item(at indexPath: IndexPath) -> (caption: String, value: String)? {
        return nil
    }
    
    
}

extension PokemonDetailPresenterStub: PokemonDetailDelegate {
    func viewLayerLoaded() {
        
    }
    
    
}

