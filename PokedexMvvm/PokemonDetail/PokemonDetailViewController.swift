//
//  PokemonDetailViewController.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation
import UIKit

final class PokemonDetailViewController: UIViewController {
    
    var DetailView:PokemonDetailView { return self.view as! PokemonDetailView }
    
    //MARK: - Init
    init() {
//        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = PokemonDetailView()
    
    }
    
    
}
