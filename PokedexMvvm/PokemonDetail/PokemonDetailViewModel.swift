//
//  PokemonDetailViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation

protocol PokemonDetailViewModelDelegate: AnyObject {
    func setPokemonView(for pokemon: PokemonDetail)
}

protocol PokemonDetailViewModelProtocol {
    var pokemonDetail:PokemonDetail { get set }
    func setPokemonView()
    var delegate: PokemonDetailViewModelDelegate? { get set }
}

final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    var pokemonDetail:PokemonDetail
    weak var delegate: PokemonDetailViewModelDelegate?
    
    init(pokemon: PokemonDetail) {
        self.pokemonDetail = pokemon
    }
    
    func setPokemonView() {
        delegate?.setPokemonView(for: pokemonDetail)
    }
    
}
