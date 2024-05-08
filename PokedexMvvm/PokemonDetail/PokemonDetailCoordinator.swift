//
//  PokemonDetailCoordinator.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//
import UIKit

struct PokemonDetailCoordinator{
    
    var naviationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.naviationController = navigationController
    }
    
    func start(pokemon: PokemonDetail) {
        naviationController.pushViewController(buildDetail(pokemon: pokemon), animated: true)
    }
    
    func buildDetail(pokemon: PokemonDetail) -> UIViewController {
        let viewModel = PokemonDetailViewModel(pokemon: pokemon)
        let viewController = PokemonDetailViewController(viewModel: viewModel)
        return viewController
    }
    
}
