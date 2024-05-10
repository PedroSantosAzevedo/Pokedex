//
//  PokemonListService.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import Alamofire

final class PokemonListService {
    
    func getList(pagination:Int, limit: Int,completion: @escaping(Result<APIResponse,AFError>) -> Void) {

        let endpoint = Endpoint.pokemon(limit, pagination)
        AF.request(endpoint).responseDecodable { (response: DataResponse<APIResponse, AFError>) in

            if let error = response.error {
                completion(.failure(error))
            }

            switch response.result {
            case.success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getPokemonDetail(url:String,completion: @escaping(Result<PokemonDetail,AFError>) -> Void) {

        let endpoint = Endpoint.details(url)
        AF.request(endpoint).responseDecodable { (response: DataResponse<PokemonDetail, AFError>) in

            if let error = response.error {
                completion(.failure(error))
            }

            switch response.result {
            case.success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

