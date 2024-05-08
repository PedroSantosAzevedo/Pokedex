//
//  PokemonListView.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

final class PokemonListView: UIView {
    
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
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
}

extension PokemonListView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}
