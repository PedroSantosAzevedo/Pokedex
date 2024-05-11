//
//  PokemonListViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation

protocol PokemonListViewModelDelegate: AnyObject {
    func updateList()
    func showErrorView()
    func hideErrorView()
}

protocol PokemonListViewModelProtocol: AnyObject {
    var delegate: PokemonListViewModelDelegate? { get set }
    
    var shouldUpdateOnScroll: Bool { get set }
    var isLoading: Bool { get set }
    var isSearching: Bool { get set }
    var pageName: String { get set }
    var sortedList: [PokemonDetail] { get set }
    var searchResult: [PokemonDetail] { get set }
    
    
    func retrieveCompleteList()
    func setSaved(index: Int)
    func searchList(for string: String)
    
}

final class PokemonListViewModel: PokemonListViewModelProtocol {
    
    weak var delegate: PokemonListViewModelDelegate?
    var service = PokemonListService()
    var dispatchGroup = DispatchGroup()
    var list: [PokemonDetail] = []
    var searchResult: [PokemonDetail] = []
    var limit: Int = 50
    var pagination: Int = 0
    var isLoading = false
    var shouldUpdateOnScroll = true
    var isSearching = false
    var pageName = "Pokedex"
    
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
        self.searchResult = []
        self.service.getPokemonDetail(url: string) { detailResult in
            switch detailResult {
            case .success(let detail):
                self.searchResult.append(detail)
                self.delegate?.hideErrorView()
                self.delegate?.updateList()
            case .failure(_):
                debugPrint("error")
                self.delegate?.updateList()
                self.delegate?.showErrorView()
            }
        }
    }
    
    private func retrieveListDetail(_ response: (APIResponse)) {
        
        response.results.forEach { item in
            self.dispatchGroup.enter()
            self.service.getPokemonDetail(url: item.name) { detailResult in
                switch detailResult {
                case .success(let detail):
                    self.list.append(detail)
                    self.delegate?.hideErrorView()
                    self.dispatchGroup.leave()
                case .failure(_):
                    debugPrint("error")
                    self.delegate?.showErrorView()
                    self.dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            [weak self] in
            guard let self = self else { return }
            self.checkForFavorites(pokemons: &self.list)
            self.delegate?.updateList()
            self.updatePagination()
            self.isLoading = false
        }
    }
    
    func checkForFavorites(pokemons: inout [PokemonDetail]) {
        guard let savedModel = FavoriteManager.retrieveModels() else { return }
        
        for i in 0..<pokemons.count {
            if savedModel.contains(where: { $0.id == pokemons[i].id && $0.name == pokemons[i].name }) {
                pokemons[i].isFav = true
            } else {
                pokemons[i].isFav = false
            }
        }
    }
    
    func retrieveCompleteList() {
        self.checkForFavorites(pokemons: &self.list)
        if isLoading {
            return
        }
        
        isLoading = true
        service.getList(pagination: pagination, limit: limit) { result in
            switch result {
            case .success(let response):
                self.retrieveListDetail(response)
            case .failure(_):
                self.delegate?.showErrorView()
            }
        }
    }
    
    func setSaved(index: Int) {
        guard var pokemon = sortedList[safe: index] else { return }
        if pokemon.isFav ?? false {
            pokemon.isFav = false
            FavoriteManager.removeModel(pokemon)
        } else {
            pokemon.isFav = true
            FavoriteManager.saveModels([pokemon])
        }
        self.checkForFavorites(pokemons: &self.list)
        self.delegate?.updateList()
    }
    
    private func updatePagination() {
        pagination += limit
    }
    
}
