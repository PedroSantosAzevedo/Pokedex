//
//  FavoriteManagerSpy.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import Foundation
import Alamofire
@testable import PokedexMvvm

class FavoriteManagerSpy: FavoriteManagerProtocol {
    
    var favoriteModels: [PokemonDetail] = []
    
    func saveModels(_ newModels: [PokemonDetail]) {
        for newModel in newModels {
            if !favoriteModels.contains(where: { $0.id == newModel.id && $0.name == newModel.name }) {
                favoriteModels.append(newModel)
            }
        }
    }
    
    func retrieveModels() -> [PokemonDetail]? {
        return favoriteModels
    }
    
    func removeModel(_ model: PokemonDetail) {
        if let index = favoriteModels.firstIndex(where: { $0.id == model.id && $0.name == model.name }) {
            favoriteModels.remove(at: index)
        }
    }
}
