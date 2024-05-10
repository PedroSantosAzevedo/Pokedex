//
//  PokemonDetailSpecFactory.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//

import Foundation


struct PokemonDetailSpecFactory {
    
    
    static func buildSpecList(for pokemon: PokemonDetail) -> [PokemonDetailSpecModel] {
        var specList: [PokemonDetailSpecModel] = []
        
        specList.append(PokemonDetailSpecModel(field: .type1, value: pokemon.types[0].type.name.rawValue))
        specList.append(PokemonDetailSpecModel(field: .type2, value: pokemon.types[safe: 1]?.type.name.rawValue ?? "none"))
        specList.append(PokemonDetailSpecModel(field: .ability1, value: pokemon.abilities[0].ability.name))
        specList.append(PokemonDetailSpecModel(field: .ability2, value: pokemon.abilities[safe: 1]?.ability.name ?? "none"))
        specList.append(PokemonDetailSpecModel(field: .weight, value: String(pokemon.weight)))
        specList.append(PokemonDetailSpecModel(field: .height, value: String(pokemon.height)))
        
        return specList
    }
    
    static func buildStats(for pokemon: PokemonDetail) -> [PokemonDetailSpecModel] {
        
        return pokemon.stats.map { PokemonDetailSpecModel(field: PokemonDetailSpecField(rawValue: $0.stat.name.rawValue), value: String($0.value))
        }
        
    }
    
}
