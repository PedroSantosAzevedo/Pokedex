//
//  PokemonDetail.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation

struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    let sprite: Sprite?


    private enum CodingKeys: String, CodingKey {
        case id, name, weight, height
        case baseExperience = "base_experience"
        case sprite = "sprites"
    }
}

extension PokemonDetail: Equatable {

    static func == (lhs: PokemonDetail, rhs: PokemonDetail) -> Bool {
        lhs.id == rhs.id
    }
}

struct Sprite: Decodable {
    let url: String

    private enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}
