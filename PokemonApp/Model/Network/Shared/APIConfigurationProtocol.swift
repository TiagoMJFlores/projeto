//
//  APIConfigurationProtocol.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Alamofire

protocol APIConfigurationProtocol: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams? { get }
    func asURLRequest() throws -> URLRequest
}


extension APIConfigurationProtocol {
    
    func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
               // NetworkConstants.ProductionServer.baseURL.asURL()
            
            var urlRequest = URLRequest(url: url)
            
            // HTTP Method
            urlRequest.httpMethod = method.rawValue
            
            // Common Headers
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            
            // Parameters
            switch parameters {
                
            case .body(let params):
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
                
            case .url(let params):
                    let queryParams = params.map { pair  in
                        return URLQueryItem(name: pair.key, value: "\(pair.value)")
                    }
                    var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                    components?.queryItems = queryParams
                    urlRequest.url = components?.url
            case .none:
                break
            }
                return urlRequest
        }
}
