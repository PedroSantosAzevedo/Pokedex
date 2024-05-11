//
//  PokemonDetailSpecModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//

enum PokemonDetailSpecField: CaseIterable {
    case type1
    case type2
    case ability1
    case ability2
    case weight
    case height
    
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
        case "specialAttack", "special attack":
            self = .specialAttack
        case "specialDefense", "special defense":
            self = .specialDefense
        case "speed":
            self = .speed
        default:
            self = .other
        }
    }
    
    
    
    var field: String {
        switch self {
        case .type1:
            return "type 1"
        case .type2:
            return "type 2"
        case .ability1:
            return "ability 1"
        case .ability2:
            return "ability 2"
        case .weight:
            return "weight"
        case .hp:
            return "hp"
        case .attack:
            return "attack"
        case .defense:
            return "defense"
        case .specialAttack:
            return "special attack"
        case .specialDefense:
            return "special defense"
        case .speed:
            return "speed"
        case .height:
            return "height"
        case .other:
            return "not found"
        }
    }

    var image: String {
        switch self {
        case .type1, .type2:
            return "pokeType"
        case .ability1, .ability2:
            return "ability"
        case .defense , .specialDefense:
            return "defense"
        case .attack, .specialAttack:
            return "specialAttack"
        case .height, .weight:
            return "weight"
        case .hp:
            return "hp"
        case .speed:
            return "speed"
        default:
            return "pokeballColor"
        }
    }
}


struct PokemonDetailSpecModel {
    let field: PokemonDetailSpecField
    let value: String
}


