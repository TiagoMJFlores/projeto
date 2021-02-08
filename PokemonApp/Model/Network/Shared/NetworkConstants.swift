//
//  NetworkConstants.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Alamofire

struct NetworkConstants {
    struct ProductionServer {
        static let baseURL = "https://pokeapi.co/api/v2/pokemon"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
    
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}
