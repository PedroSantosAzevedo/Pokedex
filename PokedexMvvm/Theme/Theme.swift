//
//  Theme.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 10/05/24.
//

import Foundation
import UIKit


struct Theme {
    
    enum Colors {
        case background
        case onBackGround
        
        
        var color: UIColor {
            switch self {
            case .background:
                return UIColor().getColorFor(r: 233, g: 237, b: 232, alpha: 1)
            case .onBackGround:
                return UIColor().getColorFor(r: 54, g: 61, b: 69, alpha: 1)
            }
        }
    }
    
    enum Fonts {
        case pokemonSolid
        case sugarBomb
        
        var name: String {
            switch self {
            case .pokemonSolid:
                return "Pokemon Solid"
            case .sugarBomb:
                return "Sugar Bomb"
            }
        }
        
        
        func getFont(size: CGFloat) -> UIFont {
            return UIFont(name: self.name, size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
    
}
