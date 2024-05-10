//
//  PokemonDetailViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation

protocol PokemonDetailViewModelDelegate: AnyObject {
    func setPokemonView(for pokemon: PokemonDetail)
    func setPokemonSpecs(for specs: [PokemonDetailSpecModel])
    func setPokemonStats(for specs: [PokemonDetailSpecModel])
}

protocol PokemonDetailViewModelProtocol {
    var pokemonDetail:PokemonDetail { get set }
    var delegate: PokemonDetailViewModelDelegate? { get set }
    func setPokemonView()
    func createSpecField()
    func createStatsField()
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
    
    func createSpecField() {
        let specs = PokemonDetailSpecFactory.buildSpecList(for: pokemonDetail)
        delegate?.setPokemonSpecs(for: specs)
    }
    
    func createStatsField() {
        let specs = PokemonDetailSpecFactory.buildStats(for: pokemonDetail)
        delegate?.setPokemonStats(for: specs)
    }
    
}
