//
//  PokemonListTableViewCell.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit
import Kingfisher
import SwiftUI


class PokemonListTableViewCell:UITableViewCell{
    
    //MARK:- Variables
    static let reusableIdentifier = "PokemonListTableViewCell"
    
    var leadingContraint: NSLayoutConstraint?
    var hasShown = false
    
    //MARK:- Views
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    
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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.minimumScaleFactor = 0.6
        label.numberOfLines = 5
        label.lineBreakMode = .byTruncatingHead
        label.textColor = .lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    //MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupView()
        self.selectionStyle = .none
  
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        pokeImage.image = UIImage()
        numberLabel.text = ""
        titleLabel.text = ""
    }
    
    
    func setUp(with pokemon: PokemonDetail){
        getImage(for: pokemon)
        getTitle(for: pokemon)
        getNumber(for: pokemon)
    }

    private func getImage(for pokemon: PokemonDetail) {

        guard let imageString = pokemon.sprite?.url else {return}
        guard let imageUrl = URL(string: imageString) else {return}
        self.pokeImage.kf.indicatorType = .activity
        self.pokeImage.kf.setImage(with: imageUrl)
 
    }
    
    private func getTitle(for pokemon: PokemonDetail) {
        self.titleLabel.text = pokemon.name

    }
    
    private func getNumber(for pokemon: PokemonDetail) {
        self.numberLabel.text = "nº\(pokemon.id)"
    }
    
    func appear() {
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut]) {
            self.leadingContraint?.constant = 8
            self.layoutIfNeeded()
        }
            UIView.animate(withDuration: 2, animations: {
            self.numberLabel.alpha = 1
            self.titleLabel.alpha = 1
        })
    }
    
    func shrink(hasShown: Bool) {
        if !hasShown { 
            leadingContraint?.constant = 500
            self.numberLabel.alpha = 0
            self.titleLabel.alpha = 0
        }
        self.layoutIfNeeded()
    }
}
//MARK:- Constraints
extension PokemonListTableViewCell: ViewCodeProtocol {
    
    func setupHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(pokeImage)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        leadingContraint = containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        leadingContraint?.isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        pokeImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pokeImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pokeImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        pokeImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32).isActive = true

        stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: pokeImage.trailingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        
    }
    
}

