//
//  PokemonListView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

class PokemonListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .purple
        
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonListView: ViewCodeProtocol {
    func setupConstraints() {
        
    }
    
    func setupHierarchy() {
        
    }
    
    
}
