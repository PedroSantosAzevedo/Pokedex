//
//  PokemonDetailViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation

protocol PokemonDetailViewModelProtocol {
    var pokemonDetail:PokemonDetail { get set }
}

final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    var pokemonDetail:PokemonDetail
    
    init(pokemon: PokemonDetail) {
        self.pokemonDetail = pokemon
    }
    
    
}
