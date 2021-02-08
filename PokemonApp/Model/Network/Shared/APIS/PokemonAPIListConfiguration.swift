//
//  PokemonAPIConfiguration.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Alamofire

final class PokemonAPIListConfiguration: APIConfigurationProtocol {
    
    private let url: String
    
    init(url: String = NetworkConstants.ProductionServer.baseURL) {
        self.url = url
    }
    
    var method: HTTPMethod {
        return .get
    }

    var parameters: RequestParams? {
        return nil
    }
    
    var path: String {
        return url
    }
    
}
