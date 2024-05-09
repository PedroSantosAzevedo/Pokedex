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
    var viewWidth = UIScreen.main.bounds.width
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.backgroundColor = .clear
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.isPagingEnabled = true
        scroll.alpha = 0
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    lazy var stackContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var pageController: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.numberOfPages = 2
        page.currentPage = 0
        page.alpha = 0
        page.pageIndicatorTintColor = .black
        page.currentPageIndicatorTintColor = .green
        return page
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
        image.contentMode = .scaleAspectFit
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
        setViewColor(for: pokemon)
        setImage(for: pokemon)
        addDetails(for: pokemon)
        setupView()
    }
    
    func addDetails(for pokemon: PokemonDetail) {
        let pokemonPageView1 = PokemonDetailPageView()
        pokemonPageView1.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(pokemonPageView1)
        pokemonPageView1.widthAnchor.constraint(equalToConstant: viewWidth - 16).isActive = true
        pokemonPageView1.addDetailView(view: PokemonDetailItemView(field: "", value: ""))
        pokemonPageView1.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        pokemonPageView1.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        pokemonPageView1.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        pokemonPageView1.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        
        
        let pokemonPageView2 = PokemonDetailPageView()
        pokemonPageView2.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(pokemonPageView2)
        pokemonPageView2.widthAnchor.constraint(equalToConstant: viewWidth - 16).isActive = true
        pokemonPageView2.addDetailView(view: PokemonDetailItemView(field: "", value: ""))
        pokemonPageView2.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        pokemonPageView2.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        pokemonPageView2.addDetailView(view:PokemonDetailItemView(field: "", value: ""))
        pokemonPageView2.addDetailView(view:PokemonDetailItemView(field: "", value: ""))

    }
    
    private func setViewColor(for pokemon: PokemonDetail) {
        let mainColor = pokemon.types[0].type.name.getColor(alpha: 0.5)
        pageController.currentPageIndicatorTintColor = mainColor
        containerView.backgroundColor = mainColor
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
            self.scrollView.alpha = 1
            self.pageController.alpha = 1
            self.layoutIfNeeded()
        }
    }
}

extension PokemonDetailView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        addSubview(bottomContainerView)
        addSubview(pokeImage)
        addSubview(scrollView)
        scrollView.addSubview(stackContentView)
        stackContentView.addSubview(stackView)
        addSubview(pageController)
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        let height = UIScreen.main.bounds.size.height
        bottomViewTopContraint = bottomContainerView.topAnchor.constraint(equalTo: topAnchor, constant: height)
        bottomViewTopContraint?.isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
        
        
        pokeImage.heightAnchor.constraint(equalToConstant: height/4).isActive = true
        pokeImage.widthAnchor.constraint(equalToConstant: height/4).isActive = true
        pokeImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        pokeImage.centerYAnchor.constraint(equalTo: bottomContainerView.topAnchor).isActive = true
        
        pageController.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageController.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 16).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: pageController.topAnchor, constant: -8).isActive = true
        
        stackContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackContentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: stackContentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: stackContentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: stackContentView.trailingAnchor).isActive = true

    }
}
