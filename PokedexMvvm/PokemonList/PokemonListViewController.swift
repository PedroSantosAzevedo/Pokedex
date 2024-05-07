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
    var service = PokemonListService()
    var dispatchGroup = DispatchGroup()
    var list: [PokemonDetail] = []

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = PokemonListView()
        
        
        
        
        dispatchGroup.enter()
        service.getList(pagination: 0, limit: 100) { result in
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
            debugPrint(self.list.sorted {$0.id < $1.id}.map {$0.name})
        }

    }
    
}
