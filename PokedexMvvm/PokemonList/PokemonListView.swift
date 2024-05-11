//
//  PokemonListView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

final class PokemonListView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.Colors.background.color
        view.backgroundColor = .clear
        view.alpha = 0.5
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 1
        label.text = "Pokedex"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = Theme.Colors.onBackGround.color
        label.font = Theme.Fonts.pokemonSolid.getFont(size: 50)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var errorView: ErrorView = {
        let errorView = ErrorView()
        errorView.isHidden = true
        errorView.translatesAutoresizingMaskIntoConstraints = false
        return errorView
    }()
    
    lazy var searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barTintColor = Theme.Colors.background.color
        searchBar.tintColor = Theme.Colors.onBackGround.color
        searchBar.barStyle = .default
        searchBar.isTranslucent = true
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = ""
        searchBar.showsCancelButton = true
        return searchBar
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.reusableIdentifier)
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.reusableIdentifier)
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = Theme.Colors.background.color
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showErrorView() {
        errorView.isHidden = false
        tableView.isHidden = true
    }
    
    func hideErrorView() {
        errorView.isHidden = true
        tableView.isHidden = false
    }
}

extension PokemonListView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(containerView)
        addSubview(searchBar)
        addSubview(titleLabel)
        addSubview(tableView)
        addSubview(errorView)
    }
    
    func setupConstraints() {
        
        containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        searchBar.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        errorView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        errorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        errorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        errorView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
}
