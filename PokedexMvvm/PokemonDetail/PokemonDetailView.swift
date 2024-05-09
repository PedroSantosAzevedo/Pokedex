//
//  PokemonDetailView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation
import UIKit

final class PokemonDetailView: UIView {
    
    var bottomViewTopContraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var pokeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.image = UIImage()
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    func setView(pokemon: PokemonDetail) {
        setBackgroundView(for: pokemon)
        setImage(for: pokemon)
        setupView()
    }
    
    private func setBackgroundView(for pokemon: PokemonDetail) {
        containerView.backgroundColor = pokemon.types[0].type.name.getColor(alpha: 0.5)
    }
    
    private func setImage(for pokemon: PokemonDetail) {
        guard let imageString = pokemon.sprite?.url else {return}
        guard let imageUrl = URL(string: imageString) else {return}
        self.pokeImage.kf.indicatorType = .activity
        self.pokeImage.kf.setImage(with: imageUrl)
    }
    
    func showBottomView() {
        let height = UIScreen.main.bounds.size.height
        self.bottomViewTopContraint?.constant = (1/3) * height
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut]) {
            self.pokeImage.alpha = 1
            self.layoutIfNeeded()
        }
    }
    
}
extension PokemonDetailView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        addSubview(bottomContainerView)
        addSubview(pokeImage)
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        let height = UIScreen.main.bounds.size.height
        bottomViewTopContraint = bottomContainerView.topAnchor.constraint(equalTo: topAnchor, constant: height)
        bottomViewTopContraint?.isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
        
        
        pokeImage.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        pokeImage.widthAnchor.constraint(equalToConstant: height/3).isActive = true
        pokeImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        pokeImage.centerYAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
    }
}
