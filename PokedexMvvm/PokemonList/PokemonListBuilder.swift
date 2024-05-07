//
//  PokemonListBuilder.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

final class PokemonListBuilder {
    
    
    func build() -> UINavigationController {
        let viewController = PokemonListViewController()
        let nav = UINavigationController(rootViewController: viewController)
        return nav
    }
    
    
}
