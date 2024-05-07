//
//  Endpoints.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import Alamofire

enum Endpoint {
    case details(String)
    case pokemon(Int, Int)
}

// MARK: -
extension Endpoint: APIConfiguration {

    var path: String {
        switch self {
        case .details(let id): return "pokemon/\(id)"
        case .pokemon(let limit, let offset): return "pokemon?limit=\(limit)&offset=\(offset)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        return nil
    }
    func asURLRequest() throws -> URLRequest {
        let url = NetworkInfo.ProductionServer.baseURL + path
        
        var urlRequest = URLRequest(url: URL(string: url)!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
