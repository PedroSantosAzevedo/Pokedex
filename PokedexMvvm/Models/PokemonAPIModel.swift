//
//  PokemonAPIModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation

struct APIResponse: Codable {
    let next: String
    let results: [APIItem]
}

// MARK: -
struct APIItem: Codable {
    let name: String
    let url: String
}
