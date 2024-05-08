//
//  PokemonDetailCoordinator.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//
import UIKit

struct PokemonDetailCoordinator: CoordinatorProtocol{
    
    var childCoodinators = [CoordinatorProtocol]()
    
    var naviationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.naviationController = navigationController
    }
    
    func start() {
        naviationController.pushViewController(buildDetail(), animated: true)
    }
    
    func buildDetail() -> UIViewController {
        let viewController = PokemonDetailViewController()
        return viewController
    }
    
}
