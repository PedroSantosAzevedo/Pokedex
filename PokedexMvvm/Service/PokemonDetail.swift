//
//  PokemonDetail.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

enum PokemonTypeName: String, Decodable {
    case normal
    case grass
    case fire
    case water
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case steel
    case fairy
    
    func getColor(alpha: CGFloat) -> UIColor {
        return UIColor().getColorForType(type: self, alpha: alpha)
    }
}

struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    let sprite: Sprite?
    var hasShown = false
    var types: [PokemonType]

    private enum CodingKeys: String, CodingKey {
        case id, name, weight, height, types
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

struct PokemonType: Decodable {
    let slot: Int
    let type: PokemonTypeSlot
}

struct PokemonTypeSlot: Decodable {
    let name: PokemonTypeName
    let url: String
}
