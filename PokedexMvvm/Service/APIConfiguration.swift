//
//  APIConfiguration.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

