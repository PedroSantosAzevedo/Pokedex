//
//  PokemonListViewModel.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation

protocol PokemonListViewModelDelegate: AnyObject {
    func updateList()
}

protocol PokemonListViewModelProtocol: AnyObject {
    var delegate: PokemonListViewModelDelegate? { get set }
    var isLoading: Bool { get set }
    var sortedList: [PokemonDetail] { get set }
    func retrieveCompleteList()
    func setSaved(index: Int)
}

final class PokemonListViewModel: PokemonListViewModelProtocol {
    
    weak var delegate: PokemonListViewModelDelegate?
    var service = PokemonListService()
    var dispatchGroup = DispatchGroup()
    var list: [PokemonDetail] = []
    var limit: Int = 50
    var pagination: Int = 0
    var isLoading = false
    
    var sortedList: [PokemonDetail]  {
        get {
            return list.sorted {$0.id < $1.id}
        }
        set {
            self.list = newValue
        }
    }
    
    private func retrieveListDetail(_ response: (APIResponse)) {
        
        response.results.forEach { item in
            self.dispatchGroup.enter()
            self.service.getPokemonDetail(url: item.name) { detailResult in
                switch detailResult {
                case .success(let detail):
                    self.list.append(detail)
                    self.dispatchGroup.leave()
                case .failure(_):
                    debugPrint("error")
                    self.dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            [weak self] in
            self?.delegate?.updateList()
            self?.updatePagination()
            self?.isLoading = false
        }
        
        
    }
    
    func retrieveCompleteList() {

        if isLoading {
            return
        }
        
        isLoading = true
        service.getList(pagination: pagination, limit: limit) { result in
            switch result {
            case .success(let response):
                self.retrieveListDetail(response)
            case .failure(_):
                debugPrint("error")
             
            }
        }
    }
    
    func setSaved(index: Int) {
        guard let pokemon = sortedList[safe: index] else { return }
        if pokemon.isFav {
            FavoriteManager.removeModel(pokemon)
        } else {
            FavoriteManager.saveModels([pokemon])
        }
    }
    
    
    private func updatePagination() {
        pagination += limit
    }
    
}
