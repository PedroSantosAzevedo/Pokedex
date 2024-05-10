//
//  PokemonListBuilder.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

struct PokemonListCoordinator {
        
    var naviationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.naviationController = navigationController
    }
    
    func start() {
        naviationController.pushViewController(PokemonListCoordinator.buildList(), animated: true)
    }
    
    static func buildList() -> UIViewController  {
        let viewModel = PokemonListViewModel()
        let router = PokemonListRouter()
        let viewController = PokemonListViewController(viewModel: viewModel, router: router)
        return viewController
    }
    
    static func buildFavList() -> UIViewController  {
        let viewModel = PokemonFavListViewModel()
        let router = PokemonListRouter()
        let viewController = PokemonListViewController(viewModel: viewModel, router: router)
        return viewController
    }
    
}
