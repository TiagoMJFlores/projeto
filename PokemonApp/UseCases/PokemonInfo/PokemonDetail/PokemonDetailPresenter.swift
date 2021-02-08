//
//  PokemonDetailPresenter.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation

enum PokemonDetailElements: Int, CaseIterable {
    case
        name,
        types,
        order,
        baseExperience,
        height,
        weight
       
    var description: String {
            get {
                switch self {
                case .name:
                    return "name"
                case .types:
                    return "types"
                case .baseExperience:
                    return "baseExperience"
                case .height:
                    return "height"
                case .order:
                    return "order"
                case .weight:
                    return "weight"
                }
             
            }
        }
}

class PokemonDetailPresenter {
    
    weak var view: PokemonDetailViewReceiver?
    private let apiService: PokemonAPIService<PokemonDetailInfo>
    private(set) var pokemonEntry: PokemonEntry
    private (set)var pokemonDetailInfo: PokemonDetailInfo?
    
    init(pokemonEntry: PokemonEntry, apiService: PokemonAPIService<PokemonDetailInfo> = PokemonAPIService()) {
        self.pokemonEntry = pokemonEntry
        self.apiService = apiService
    }
    
    func fetchPokemonData( callback: @escaping (PokemonDetailInfo) -> Void) {
    
        guard let pokemonDetailInfo = pokemonDetailInfo else {
            let pokemonId =  pokemonEntry.url

            apiService.doRequest(url: pokemonId) { (pokemonDetailInfo) in
                self.pokemonDetailInfo = pokemonDetailInfo
                callback(pokemonDetailInfo)
            }
            return 
        }
        callback(pokemonDetailInfo)
      
    }
    
}


// MARK: PokemonDetailDelegate
extension PokemonDetailPresenter: PokemonDetailDelegate {
    
    func viewLayerLoaded() {
        
        
        fetchPokemonData { [weak self] pokemonDetailInfo in
            guard let self = self else {
                return
            }
 
            self.view?.showPokemonInfo(pokemonInfo: pokemonDetailInfo)
        }
    }
    
    
}

extension PokemonDetailPresenter: PokemonDetailDatasource {
  
    
    func numberItems() -> Int {
        return PokemonDetailElements.allCases.count
    }
    
    func item(at indexPath: IndexPath) -> (caption: String, value: String)? {
        guard let pokemonDetailInfo = pokemonDetailInfo else {
            return nil
        }
        
        let enumElement = PokemonDetailElements.allCases[indexPath.row]
       
        switch indexPath.row {
        
        case  PokemonDetailElements.types.rawValue:
         
            let type = "~\(pokemonDetailInfo.types.first?.type.name ?? "")"
            return (caption: enumElement.description, value:  type)
            
        case PokemonDetailElements.baseExperience.rawValue:
            return (caption: enumElement.description, value:  "~\(pokemonDetailInfo.baseExperience)")
          
        case PokemonDetailElements.height.rawValue:
            return (caption: enumElement.description, value: "~\(pokemonDetailInfo.height)")

        case PokemonDetailElements.order.rawValue:
            return (caption: enumElement.description, value: "~\(pokemonDetailInfo.order)")
            
        case PokemonDetailElements.weight.rawValue:
            return  (caption: enumElement.description, value: "~\(pokemonDetailInfo.weight)")
        case PokemonDetailElements.name.rawValue:
            return  (caption: enumElement.description, value: "~\(pokemonDetailInfo.name)")
            
        default:
            return nil
        }
        
    }
    
    
}
