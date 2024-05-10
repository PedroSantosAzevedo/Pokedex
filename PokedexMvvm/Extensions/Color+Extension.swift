//
//  Color+Extension.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import UIKit

extension UIColor {
    
    func getColorFor(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor.init(displayP3Red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    
    
    func getColorForType(type: PokemonTypeName, alpha: CGFloat) -> UIColor {

        switch type {
        case .normal:
            return getColorFor(r: 187, g: 188, b: 172, alpha: alpha)
        case .grass:
            return getColorFor(r: 139, g: 215, b: 81, alpha: alpha)
        case .fire:
            return getColorFor(r: 250, g: 85, b: 66, alpha: alpha)
        case .water:
            return getColorFor(r: 86, g: 174, b: 254, alpha: alpha)
        case .fighting:
            return getColorFor(r: 164, g: 89, b: 68, alpha: alpha)
        case .flying:
            return getColorFor(r: 124, g: 164, b: 251, alpha: alpha)
        case .poison:
            return getColorFor(r: 170, g: 95, b: 162, alpha: alpha)
        case .ground:
            return getColorFor(r: 237, g: 203, b: 87, alpha: alpha)
        case .rock:
            return getColorFor(r: 206, g: 188, b: 114, alpha: alpha)
        case .bug:
            return getColorFor(r: 195, g: 210, b: 31, alpha: alpha)
        case .ghost:
            return getColorFor(r: 121, g: 117, b: 214, alpha: alpha)
        case .electric:
            return getColorFor(r: 254, g: 230, b: 57, alpha: alpha)
        case .psychic:
            return getColorFor(r: 250, g: 101, b: 183, alpha: alpha)
        case .ice:
            return getColorFor(r: 149, g: 241, b: 254, alpha: alpha)
        case .dragon:
            return getColorFor(r: 137, g: 119, b: 255, alpha: alpha)
        case .dark:
            return getColorFor(r: 142, g: 104, b: 86, alpha: alpha)
        case .steel:
            return getColorFor(r: 196, g: 194, b: 218, alpha: alpha)
        case .fairy:
            return getColorFor(r: 249, g: 175, b: 254, alpha: alpha)
        }
    }
    
}

