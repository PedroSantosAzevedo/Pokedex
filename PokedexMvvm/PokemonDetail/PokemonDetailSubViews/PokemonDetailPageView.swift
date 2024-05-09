//
//  PokemonDetailPageView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//

import Foundation
import UIKit

final class PokemonDetailPageView: UIView {
    
    //MARK: - Views
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.backgroundColor = .clear
        stack.distribution = .equalCentering
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .clear
        setupView()
        
    }
    
    func addDetailView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        view.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PokemonDetailPageView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(stackView)

    }
    
    func setupConstraints() {
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
