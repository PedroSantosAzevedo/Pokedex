//
//  PokemonFavListViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 10/05/24.
//

import Foundation

final class PokemonFavListViewModel: PokemonListViewModelProtocol {
    var pageName = "Favorites"
    
    var shouldUpdateOnScroll: Bool = false
    
    weak var delegate: PokemonListViewModelDelegate?
    
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
    
    func setSaved(index: Int) {
        guard var pokemon = sortedList[safe: index] else { return }
        if pokemon.isFav ?? false {
            FavoriteManager.removeModel(pokemon)
        } else {
            pokemon.isFav = true
            FavoriteManager.saveModels([pokemon])
        }
        
        retrieveCompleteList()
    }
    
    func retrieveCompleteList() {
        guard var retrievedList = FavoriteManager.retrieveModels() else {
            debugPrint("show error")
            return
        }
        retrievedList = retrievedList.map({ pokemon in
            var modifiedPoke = pokemon
            modifiedPoke.isFav = true
            return modifiedPoke
            
        })
        
        list = retrievedList
        delegate?.updateList()
    }

}
