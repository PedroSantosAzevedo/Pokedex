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
    var searchResult: [PokemonDetail] = []
    var isSearching: Bool = false
    
    var sortedList: [PokemonDetail]  {
        get {
            return list.sorted {$0.id < $1.id}
        }
        set {
            self.list = newValue
        }
    }
    
    func searchList(for string: String) {
        isSearching = true
        if let index = sortedList.firstIndex(where: { String($0.id) == string || $0.name == string }) {
            searchResult = [sortedList[index]]
        }
        
        if searchResult.isEmpty {
            self.delegate?.showErrorView()
        } else {
            self.delegate?.hideErrorView()
        }
        
        self.delegate?.updateList()
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
            self.delegate?.showErrorView()
            return
        }
        retrievedList = retrievedList.map({ pokemon in
            var modifiedPoke = pokemon
            modifiedPoke.isFav = true
            modifiedPoke.hasShown = true
            return modifiedPoke
            
        })
        
        list = retrievedList
        self.delegate?.hideErrorView()
        delegate?.updateList()
    }
    
}
