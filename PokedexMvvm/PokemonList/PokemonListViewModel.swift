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

final class PokemonListViewModel {
    
    weak var delegate: PokemonListViewModelDelegate?
    var service = PokemonListService()
    var dispatchGroup = DispatchGroup()
    var list: [PokemonDetail] = []
    var limit: Int = 100
    var pagination: Int = 0
    
    var sortedList: [PokemonDetail] {
        return list.sorted {$0.id < $1.id}
    }
    
    func retrieveCompleteList() {
        dispatchGroup.enter()
        service.getList(pagination: pagination, limit: limit) { result in
            switch result {
            case .success(let response):
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
            case .failure(_):
                debugPrint("error")
             
            }
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            [weak self] in
            self?.delegate?.updateList()
            self?.updatePagination()
            

        }

    }
    
    private func updatePagination() {
        pagination += limit
    }
    
}