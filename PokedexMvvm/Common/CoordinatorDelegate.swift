//
//  CoordinatorDelegate.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import UIKit


public protocol CoordinatorProtocol {
    var childCoodinators: [CoordinatorProtocol] { get set }
    var naviationController: UINavigationController { get set }
    func start()
}
