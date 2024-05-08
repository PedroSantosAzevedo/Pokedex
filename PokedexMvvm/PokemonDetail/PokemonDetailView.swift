//
//  PokemonDetailView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation
import UIKit

final class PokemonDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .purple
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
}
extension PokemonDetailView: ViewCodeProtocol {
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
    
    
}
