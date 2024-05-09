//
//  PokemonDetailItemView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//

import Foundation
import UIKit

final class PokemonDetailItemView: UIView {
    
    var leadingContraint: NSLayoutConstraint?
    
    //MARK: - Views
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 1
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.alpha = 1
        label.text = "Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: - Init
    convenience init(field: String, value: String) {
        self.init()
//
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .clear
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension PokemonDetailItemView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(valueLabel)
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        leadingContraint = containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        leadingContraint?.isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -8).isActive = true
        
        
        valueLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -8).isActive = true
        
    }
    
}
