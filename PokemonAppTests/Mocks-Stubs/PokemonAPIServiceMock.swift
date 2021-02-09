//
//  PokemonAPIServiceStub.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 07/02/2021.
//

import Foundation
@testable import PokemonApp
import Alamofire

class PokemonAPIServiceMock: PokemonAPIService<PokemonResultContainer> {
    var data: PokemonResultContainer?
    
    override func doRequest(url: String, completionHandler:( @escaping (PokemonResultContainer) -> Void)) {
        if let data = data {
            completionHandler(data)
        }
  
    }
}

