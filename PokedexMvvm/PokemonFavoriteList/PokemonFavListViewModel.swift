//
//  PokemonFavListViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 10/05/24.
//

import Foundation

final class PokemonFavListViewModel: PokemonListViewModelProtocol {
    func setSaved(index: Int) {
        
    }
    
    var delegate: PokemonListViewModelDelegate?
    
    var isLoading: Bool = false
    
    var list: [PokemonDetail] = []

    var sortedList: [PokemonDetail]  {
        get {
            return list.sorted {$0.id < $1.id}
        }
        set {
            self.list = newValue
        }
    }
    
    func retrieveCompleteList() {
        guard let retrievedList = FavoriteManager.retrieveModels() else {
            debugPrint("show error")
            return
        }
        
        list = retrievedList
        delegate?.updateList()
    }

}
