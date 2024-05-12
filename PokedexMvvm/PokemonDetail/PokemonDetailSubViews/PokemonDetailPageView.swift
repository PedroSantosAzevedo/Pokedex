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
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = true
        scroll.bounces = false
        return scroll
    }()
    
    lazy var stackContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .clear
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDetailView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(view)
        view.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }

}

extension PokemonDetailPageView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(stackContentView)
        stackContentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        
        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        stackContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: stackContentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: stackContentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: stackContentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: stackContentView.bottomAnchor).isActive = true
        
    }
}
