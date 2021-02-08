//
//  PokemonAPIService.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation
import Alamofire

    
class PokemonAPIService<T: Codable> {
    

    func doRequest(url: String, completionHandler:( @escaping (T) -> Void)) {
        let apiConfiguration = PokemonAPIListConfiguration(url: url)
        AF.request(apiConfiguration).validate(statusCode: 200..<299)
            .responseDecodable { (response: AFDataResponse<T>)  in
              
                switch response.result {
                case let .failure(error):
                            print(error)
                     
                default:
                    guard let data = response.value else { return }
                    completionHandler(data)
                    break
               
                }
        }
    }
    
}
