//
//  NetworkInfo.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation

struct NetworkInfo {
    struct ProductionServer {
        static let baseURL = "https://pokeapi.co/api/v2/"
        
    }
    
    struct APIParameterKey {
        static let apiKey = "0c909c364c0bc846b72d0fe49ab71b83"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
