//
//  PokemonListViewController.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

final class PokemonListViewController: UIViewController {
    
    
    //MARK: - Properties
    var listView:PokemonListView {return self.view as! PokemonListView}
    var viewModel = PokemonListViewModel()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = PokemonListView()
        viewModel.retrieveCompleteList()
        viewModel.delegate = self
    }
    
}

extension PokemonListViewController: PokemonListViewModelDelegate {
    func updateList() {
        let list = viewModel.sortedList
        debugPrint(list)
    }
}
