//
//  PokemonServiceSpy.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import Foundation
import Alamofire
@testable import PokedexMvvm

struct PokemonServiceSpy: PokemonListServiceProtocol {
    
    var shouldReturnError = false
    
    func getList(pagination: Int, limit: Int, completion: @escaping (Result<APIResponse, AFError>) -> Void) {
        if shouldReturnError {
            completion(.failure(AFError.invalidURL(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/132.svg")!)))
            return
        } else {
            completion(.success(APIResponse.init(next: "", results: [APIItem.init(name: "", url: "")])))
        }
    }
    
    func getPokemonDetail(url: String, completion: @escaping (Result<PokemonDetail, AFError>) -> Void) {
        if shouldReturnError {
            completion(.failure(AFError.invalidURL(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/132.svg")!)))
            return
        } else {
            
            let types = [PokemonType.init(slot: 0, type: PokemonTypeSlot.init(name: .normal, url: "")), PokemonType.init(slot: 1, type: PokemonTypeSlot.init(name: .fire, url: ""))]
            let abilities = [Ability.init(ability: .init(name: "ember", url: "")), Ability.init(ability: .init(name: "fire blast", url: ""))]
            
            let stats = [Stat.init(stat: StatSlot.init(name: .attack, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .defense, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .hp, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .specialAttack, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .specialDefense, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .speed, url: ""), value: 64)]
            
            let pokemonDetail = PokemonDetail.init(id: 1, name: "ditto", weight: 5, height: 64, baseExperience: 420, sprite: .init(url: "", other: .init(dreamSprite: .init(url: ""))), types: types, abilities: abilities, stats: stats)
            completion(.success(pokemonDetail))
            return
        }
    }
    
    
}
