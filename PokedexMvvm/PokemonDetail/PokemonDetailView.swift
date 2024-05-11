//
//  PokemonDetailView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation
import UIKit
import SVGKit

final class PokemonDetailView: UIView {
    
    let height = UIScreen.main.bounds.size.height
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
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = Theme.Fonts.sugarBomb.getFont(size: 30)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    lazy var titleContainerView: UIView = {
        let view = UIView()
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var pokeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.image = UIImage()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var ballImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.image = UIImage(named: "detailBall")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.alpha = 0.5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.Colors.background.color
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pokemonDetailContainerView: PokemonDetailContainerView = {
        let view = PokemonDetailContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setView(pokemon: PokemonDetail) {
        setViewColor(for: pokemon)
        setImage(for: pokemon)
        setTitle(for: pokemon)
        setupView()
    }
    
    private func setViewColor(for pokemon: PokemonDetail) {
        let mainColor = pokemon.types[0].type.name.getColor(alpha: 0.5)
        pokemonDetailContainerView.pageController.currentPageIndicatorTintColor = mainColor
        containerView.backgroundColor = mainColor
    }
    
    private func setTitle(for pokemon: PokemonDetail) {
        titleLabel.text = pokemon.name.capitalizedFirstLetter()
    }
    
    private func setImage(for pokemon: PokemonDetail) {
        let imageString = pokemon.sprite.other.dreamSprite.url
        guard let imageUrl = URL(string: imageString) else {return}
        let svgImage = SVGKImage(contentsOf: imageUrl)
        self.pokeImage.image = svgImage?.uiImage
    }
    
    func showBottomView() {
        let height = UIScreen.main.bounds.size.height
        self.bottomViewTopContraint?.constant = (1/3) * height
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut]) {
            self.pokeImage.alpha = 1
            self.pokemonDetailContainerView.alpha = 1
            self.pokemonDetailContainerView.pageController.alpha = 1
            self.layoutIfNeeded()
        }
    }
}

extension PokemonDetailView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(ballImage)
        containerView.addSubview(titleContainerView)
        addSubview(titleLabel)
        addSubview(bottomContainerView)
        addSubview(pokeImage)
        bottomContainerView.addSubview(pokemonDetailContainerView)
        
    }
    
    func setupConstraints() {
        
        containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        titleContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        titleContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
               
        titleLabel.centerXAnchor.constraint(equalTo: titleContainerView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: -8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor, constant: -8).isActive = true
        
        bottomViewTopContraint = bottomContainerView.topAnchor.constraint(equalTo: topAnchor, constant: height)
        bottomViewTopContraint?.isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        pokeImage.heightAnchor.constraint(equalToConstant: height/4).isActive = true
        pokeImage.widthAnchor.constraint(equalToConstant: height/4).isActive = true
        pokeImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        pokeImage.centerYAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        
        ballImage.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        ballImage.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        ballImage.widthAnchor.constraint(equalToConstant: height/3).isActive = true
        ballImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 64).isActive = true
        
        
        
        pokemonDetailContainerView.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 16).isActive = true
        pokemonDetailContainerView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 0).isActive = true
        pokemonDetailContainerView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: 0).isActive = true
        pokemonDetailContainerView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -8).isActive = true

    }
}
