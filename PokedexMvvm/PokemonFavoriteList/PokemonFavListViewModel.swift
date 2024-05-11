//
//  PokemonFavListViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 10/05/24.
//

import Foundation

final class PokemonFavListViewModel: PokemonListViewModelProtocol {
    var favoriteManager: FavoriteManagerProtocol = FavoriteManager()
    
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
        var selectedPokemon: PokemonDetail?
        
        if isSearching {
            guard let pokemon = searchResult[safe: index] else { return }
            selectedPokemon = pokemon
        } else {
            guard let pokemon = sortedList[safe: index] else { return }
            selectedPokemon = pokemon
        }
        
        guard var selectedPokemon = selectedPokemon else { return }
        if selectedPokemon.isFav ?? false {
            favoriteManager.removeModel(selectedPokemon)
            searchResult.remove(at: index)
        } else {
            selectedPokemon.isFav = true
            favoriteManager.saveModels([selectedPokemon])
        }
        
        retrieveCompleteList()
    }
    
    func retrieveCompleteList() {
        guard var retrievedList = favoriteManager.retrieveModels() else {
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
