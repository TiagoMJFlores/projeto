//
//  PokemonListPresenter.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation



class PokemonListPresenter {
    
    private let apiService: PokemonAPIService<PokemonResultContainer>
    private (set) var data: [PokemonDetailPresenter]?
    private let coordinator: PokemonListCoordinatorProtocol
    private(set) var maxElements: Int = 0
    private (set) var nextPage: String = ""
  
    weak var view: PokemonListViewReceiver?
    
    init(coordinator: PokemonListCoordinatorProtocol,  apiService: PokemonAPIService<PokemonResultContainer> = PokemonAPIService()
    ) {

        self.coordinator = coordinator
        self.apiService = apiService
    }
    
}


// MARK: PokemonListDatasource
extension PokemonListPresenter: PokemonListDatasource {

    func numberItems() -> Int {
        return data?.count ?? 0
    }
    
    func item(at indexPath: IndexPath) -> PokemonDetailPresenter? {
        guard let data = data else {
            return nil
        }

        fetchNextPageIfNeeded(at: indexPath)
        let presenter = data[indexPath.row]
        return presenter
    }
    
    private func fetchNextPageIfNeeded(at indexPath: IndexPath) {
        guard let data = data else {
            return
        }
        if (indexPath.row == data.count - 4 && indexPath.row < maxElements) {
            doRequest(url: nextPage, addElements: true)
        }
    }
    
    private func doRequest(url: String, addElements: Bool = false) {
        apiService.doRequest(url: url) { [weak self] pokemonResultContainer in
            guard let self = self else {
                return
            }
            self.maxElements = pokemonResultContainer.count
            self.nextPage = pokemonResultContainer.next
            let moreData = pokemonResultContainer.results.map {
                PokemonDetailPresenter(pokemonEntry: $0)
            }
            if addElements {
                self.data?.append(contentsOf: moreData)
            } else {
                self.data = moreData
            }
       
            self.view?.reloadData()
        }
    }
}


// MARK: PokemonListDelegate
extension PokemonListPresenter: PokemonListDelegate {
    
    func didSelectRow(at indexPath: IndexPath) {
    
        guard let detailPresenter = data?[indexPath.row] else {
            return
        }
        coordinator.presentDetail(detailPresenter: detailPresenter)
    }
    
    
    func viewLayerLoaded() {
        doRequest(url: NetworkConstants.ProductionServer.baseURL)
    }
    
    
}

