//
//  PokemonDetailViewController.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 08/05/24.
//

import Foundation
import UIKit

final class PokemonDetailViewController: UIViewController {
    
    var detailView:PokemonDetailView { return self.view as! PokemonDetailView }
    var viewModel: PokemonDetailViewModelProtocol
    
    //MARK: - Init
    init(viewModel: PokemonDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        viewModel.setPokemonView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: UIDevice.orientationDidChangeNotification, object: nil)
        setupPageController()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = PokemonDetailView()

    }
    
    private func setupPageController() {
        detailView.scrollView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailView.showBottomView()
    }
    
    @objc private func updateView() {
        detailView.showBottomView()
        detailView.updateConstraints()
        detailView.layoutIfNeeded()
    }
    
}
extension PokemonDetailViewController: PokemonDetailViewModelDelegate {
    func setPokemonView(for pokemon: PokemonDetail) {
        detailView.setView(pokemon: pokemon)
        debugPrint("setView")
    }
}

extension PokemonDetailViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        detailView.pageController.currentPage = Int(pageNumber)
    }
}
