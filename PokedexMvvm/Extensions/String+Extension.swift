//
//  String+Extension.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//


extension String {
    func capitalizedFirstLetter() -> String {
        guard !self.isEmpty else { return self }
        let first = self.prefix(1).uppercased()
        let rest = self.dropFirst()
        return first + rest
    }
}
