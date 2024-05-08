//
//  RouterProtocol.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import UIKit

protocol RouterProtocol {
    
//    var navigationController: UINavigationController? { get set }
    func goTo(path: String, in navigationController: UINavigationController?, parameters: [String : Any]?)
    var routes: [String : ((UINavigationController?, [String : Any]?) -> Void)] { get set }
    
    
    
}
