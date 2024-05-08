//
//  PokemonListViewController.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

final class PokemonListViewController: UIViewController {
    
    
    //MARK: - Properties
    var listView:PokemonListView {return self.view as! PokemonListView}
    var viewModel = PokemonListViewModel()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = PokemonListView()
        viewModel.retrieveCompleteList()
        setupTableViewDelegates()
        viewModel.delegate = self
        
    }
    
    func setupTableViewDelegates() {
        listView.tableView.dataSource = self
        listView.tableView.delegate = self
    }
    
}

extension PokemonListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sortedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.reusableIdentifier, for: indexPath) as? PokemonListTableViewCell else { return UITableViewCell() }
        cell.setUp(with: viewModel.sortedList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        guard let cell = cell as? PokemonListTableViewCell else { return }
        
        cell.shrink(hasShown: viewModel.sortedList[indexPath.row].hasShown)
        cell.appear()
        viewModel.sortedList[indexPath.row].hasShown = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(viewModel.sortedList[indexPath.row].name)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            self.viewModel.retrieveCompleteList()
        }
    }
    
    
}


extension PokemonListViewController: PokemonListViewModelDelegate {
    func updateList() {
        listView.tableView.reloadData()
    }
}
