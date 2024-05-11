//
//  ErrorView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 10/05/24.
//

import Foundation
import UIKit
import SVGKit

class ErrorView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "Ops something happened"
        label.textAlignment = .center
        label.font = Theme.Fonts.sugarBomb.getFont(size: 30)
        label.textColor = Theme.Colors.onBackGround.color
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.text = "Pokemon not found"
        label.font = Theme.Fonts.sugarBomb.getFont(size: 30)
        label.textColor = Theme.Colors.onBackGround.color
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var layoutGuide: UILayoutGuide = {
        return UILayoutGuide()
    }()

    lazy var pokeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.tintColor = .white
        let URL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/132.svg")
        image.image = SVGKImage(contentsOf: URL).uiImage
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    convenience init(text: String? = nil, imageName: String? = nil, subTitle: String? = nil) {
        self.init()
        setText(text)
        setImage(imageName)
        setSubTitle(subTitle)
        backgroundColor = Theme.Colors.background.color
        setupView()
        
    }
    
    private func setText(_ text: String?) {
        guard let text = text else { return }
        titleLabel.text = text
    }
    
    private func setImage(_ imageName: String?) {
        guard let imageName = imageName else { return }
        pokeImage.image = UIImage(named: imageName)
    }
    
    private func setSubTitle(_ text: String?) {
        guard let text = text else { return }
        subTitleLabel.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = Theme.Colors.background.color
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension ErrorView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(pokeImage)
        addSubview(subTitleLabel)
        
    }
    
    func setupConstraints() {
        
        let height = UIScreen.main.bounds.height
        
        pokeImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pokeImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pokeImage.heightAnchor.constraint(equalToConstant: height/6).isActive = true
        pokeImage.widthAnchor.constraint(equalToConstant: height/6).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: pokeImage.topAnchor, constant: -16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 16).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
   
    }
}
