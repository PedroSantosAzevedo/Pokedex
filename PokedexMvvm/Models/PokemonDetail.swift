//
//  PokemonDetail.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

enum PokemonTypeName: String, Codable {
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

enum PokemonStats: String, Codable {
    case hp
    case attack
    case defense
    case specialAttack
    case specialDefense
    case speed
    case other
    
    
    public init(rawValue: String) {
        switch rawValue {
        case "hp":
            self = .hp
        case "attack":
            self = .attack
        case "defense":
            self = .defense
        case "special-attack", "specialAttack":
            self = .specialAttack
        case "special-defense", "specialDefense":
            self = .specialDefense
        case "speed":
            self = .speed
        default:
            self = .other
        }
    }
    
}

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    let sprite: Sprite
    var hasShown = false
    var types: [PokemonType]
    var abilities: [Ability]
    var stats: [Stat]
    var isFav:Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, weight, height, types, abilities, stats
        case baseExperience = "base_experience"
        case sprite = "sprites"
    }
}

extension PokemonDetail: Equatable {
    
    static func == (lhs: PokemonDetail, rhs: PokemonDetail) -> Bool {
        lhs.id == rhs.id
    }
}

struct Sprite: Codable {
    let url: String
    let other: OtherSprites
    
    private enum CodingKeys: String, CodingKey {
        case other
        case url = "front_default"
    }
}

struct OtherSprites: Codable {
    let dreamSprite: DreamSprite
    
    private enum CodingKeys: String, CodingKey {
        case dreamSprite = "dream_world"
    }
}

struct DreamSprite: Codable {
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}

struct PokemonType: Codable {
    let slot: Int
    let type: PokemonTypeSlot
}

struct PokemonTypeSlot: Codable {
    let name: PokemonTypeName
    let url: String
}

struct Ability: Codable {
    let ability: APIItem
}

struct Stat: Codable {
    let stat: StatSlot
    let value: Int
    
    private enum CodingKeys: String, CodingKey {
        case stat
        case value = "base_stat"
    }
}

struct StatSlot: Codable {
    let name: PokemonStats
    let url: String
}
