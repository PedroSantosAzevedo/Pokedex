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
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 1
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = Theme.Colors.onBackGround.color
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var pokeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.image = UIImage(named: "pokeballColor")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.alpha = 1
        label.text = "Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = Theme.Colors.onBackGround.color
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: - Init
    convenience init(field: String, value: String, image: String) {
        self.init()
        self.titleLabel.text = field
        self.valueLabel.text = value
        self.pokeImage.image = UIImage(named: image)
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
        containerView.addSubview(pokeImage)
        containerView.addSubview(valueLabel)
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        leadingContraint = containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        leadingContraint?.isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

        pokeImage.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8).isActive = true
        pokeImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 16).isActive = true
        pokeImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -8).isActive = true
        pokeImage.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        pokeImage.widthAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: pokeImage.trailingAnchor,constant: 16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -8).isActive = true
        
        valueLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -8).isActive = true
        
    }
    
}
