//
//  PokemonListRouter.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

struct PokemonListRouter: RouterProtocol {

    static var detailRoute = "detailRoute"
    
    
    var routes: [String : ((UINavigationController?, [String : Any]?) -> Void)] = [detailRoute:goToDetail]
    
    func goTo(path: String, in navigation: UINavigationController?, parameters: [String : Any]?) {
        routes[path]?(navigation,parameters)
    }

    static func goToDetail(in navigation: UINavigationController?, with parameters: [String : Any]?) {
        guard let nav = navigation else {
            return
        }
        PokemonDetailCoordinator(navigationController: nav).start()
        
    }
    
    
}
