//
//  PokemonDetailContainerView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 09/05/24.
//

import Foundation
import UIKit


class PokemonDetailContainerView: UIView {
    
    var viewWidth = UIScreen.main.bounds.width
    
    //MARK: - SubViews
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
        scroll.alpha = 1
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.bounces = false
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
        page.alpha = 1
        page.pageIndicatorTintColor = .black
        page.currentPageIndicatorTintColor = .green
        return page
    }()
    
    //MARK: - Init
    convenience init(field: String, value: String) {
        self.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .clear
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDetails(detailList: [PokemonDetailSpecModel]) {
        let pokemonPageView1 = PokemonDetailPageView()
        pokemonPageView1.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(pokemonPageView1)
        pokemonPageView1.widthAnchor.constraint(equalToConstant: viewWidth - 16).isActive = true
        
        detailList.forEach { model in
            pokemonPageView1.addDetailView(view: PokemonDetailItemView(field: model.field.field, value: model.value, image: model.field.image))
        }
    }

}

extension PokemonDetailContainerView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackContentView)
        stackContentView.addSubview(stackView)
        addSubview(pageController)
    }
    
    func setupConstraints() {
        
        pageController.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        pageController.heightAnchor.constraint(equalToConstant: 24).isActive = true
        pageController.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: pageController.topAnchor, constant: -32).isActive = true
        
        stackContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        stackContentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: stackContentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: stackContentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: stackContentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: stackContentView.bottomAnchor).isActive = true
    }
}
