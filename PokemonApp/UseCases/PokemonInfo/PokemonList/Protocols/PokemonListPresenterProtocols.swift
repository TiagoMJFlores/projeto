//
//  PokemonListPresenterProtocols.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation


typealias PokemonListPresenterProtocol = PokemonListDatasource & PokemonListDelegate

protocol PokemonListDatasource {
    func numberItems() -> Int
    func item(at indexPath: IndexPath) -> PokemonDetailPresenter?
}

protocol PokemonListDelegate {
    func viewLayerLoaded()
    func didSelectRow(at indexPath: IndexPath)
}
