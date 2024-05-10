//
//  Collection+Extension.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
