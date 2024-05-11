//
//  FavoriteManager.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 10/05/24.
//

import Foundation

protocol FavoriteManagerProtocol {
    func saveModels(_ newModels: [PokemonDetail])
    func retrieveModels() -> [PokemonDetail]?
    func removeModel(_ model: PokemonDetail)
}

struct FavoriteManager: FavoriteManagerProtocol {
    
    private let userDefaults = UserDefaults.standard
    private let key = "favorites"
    
    func saveModels(_ newModels: [PokemonDetail]) {
        var existingModels = retrieveModels() ?? []

        for newModel in newModels {
            if !existingModels.contains(where: { $0.id == newModel.id && $0.name == newModel.name }) {
                existingModels.append(newModel)
            }
        }

        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(existingModels)
            userDefaults.set(encodedData, forKey: key)
        } catch {
            print("Error encoding models: \(error.localizedDescription)")
        }
    }
    
    
    func retrieveModels() -> [PokemonDetail]? {
        guard let encodedData = userDefaults.data(forKey: key) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let models = try decoder.decode([PokemonDetail].self, from: encodedData)
            return models
        } catch {
            print("Error decoding models: \(error.localizedDescription)")
            return nil
        }
    }
    
    func removeModel(_ model: PokemonDetail) {
           guard var savedModels = retrieveModels() else {
               return
           }
           
           if let index = savedModels.firstIndex(where: { $0.id == model.id && $0.name == model.name }) {
               savedModels.remove(at: index)
               
               do {
                   let encoder = JSONEncoder()
                   let encodedData = try encoder.encode(savedModels)
                   userDefaults.set(encodedData, forKey: key)
               } catch {
                   print("Error encoding models: \(error.localizedDescription)")
               }
           }
       }
}
