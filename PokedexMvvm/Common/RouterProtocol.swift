//
//  RouterProtocol.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import UIKit

protocol RouterProtocol {
    
    var navigationController: UINavigationController? { get set }
    func route()
    
}
