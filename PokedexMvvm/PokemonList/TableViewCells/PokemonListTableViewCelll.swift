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

protocol PokemonListTableViewCellDelegate: AnyObject {
    func didSelectFav(indexPath: IndexPath?)
}

class PokemonListTableViewCell:UITableViewCell{
    
    //MARK:- Variables
    static let reusableIdentifier = "PokemonListTableViewCell"
    
    weak var delegate: PokemonListTableViewCellDelegate?
    var leadingContraint: NSLayoutConstraint?
    var hasShown = false
    var indexPath: IndexPath?
    
    //MARK:- Views
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isAccessibilityElement = true
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
        label.isAccessibilityElement = false
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
    

    lazy var ballButton: UIButton = {
        let image = UIButton()
        image.backgroundColor = .clear
        image.tintColor = .white
        image.addTarget(self, action: #selector(capturePokemon), for: .touchUpInside)
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
        label.isAccessibilityElement = false
        label.lineBreakMode = .byTruncatingHead
        label.textColor = .white
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
    
    @objc func capturePokemon() {
        delegate?.didSelectFav(indexPath: self.indexPath)
        ballButton.setImage(UIImage(named: "pokeballColor"), for: .normal)
    }
    
    private func setAccessibility() {
        self.containerView.accessibilityValue = "\(titleLabel.text ?? ""), \(numberLabel.text ?? "")"
        self.accessibilityElements = [containerView, ballButton]
    }
    
    func setUp(with pokemon: PokemonDetail, indexPath: IndexPath){
        getImage(for: pokemon)
        getTitle(for: pokemon)
        getNumber(for: pokemon)
        getColor(for: pokemon)
        getFav(for: pokemon)
        self.indexPath = indexPath
        setAccessibility()
    }
    
    func getFav(for pokemon: PokemonDetail) {
        let imageName =  pokemon.isFav ?? false ?  "favBall" : "notFavBall"
        let accessibility =  "Favorite button"
        
        ballButton.setImage(UIImage(named: imageName), for: .normal)
        ballButton.accessibilityLabel = accessibility
        ballButton.accessibilityHint = "Select to add or remove from favorites"
        ballButton.accessibilityValue = pokemon.isFav ?? false ?  "selected" : "not selected"
    }

    func getColor(for pokemon: PokemonDetail) {
        containerView.backgroundColor = UIColor().getColorForType(type: pokemon.types[0].type.name, alpha: 0.2)
    }
    
    private func getImage(for pokemon: PokemonDetail) {

        let imageString = pokemon.sprite.url
        guard let imageUrl = URL(string: imageString) else {return}
        self.pokeImage.kf.indicatorType = .activity
        self.pokeImage.kf.setImage(with: imageUrl)
 
    }
    
    private func getTitle(for pokemon: PokemonDetail) {
        self.titleLabel.text = pokemon.name.capitalizedFirstLetter()

    }
    
    private func getNumber(for pokemon: PokemonDetail) {
        self.numberLabel.text = "nº\(pokemon.id)"
    }
    
    func appear() {
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut]) {
            self.leadingContraint?.constant = 16
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
        containerView.addSubview(ballButton)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        leadingContraint = containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        leadingContraint?.isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        pokeImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        pokeImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        pokeImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        pokeImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32).isActive = true
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        
        ballButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ballButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ballButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        ballButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32).isActive = true

        stackView.leadingAnchor.constraint(equalTo: pokeImage.trailingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: ballButton.leadingAnchor, constant: -16).isActive = true
        
    }
    
}

