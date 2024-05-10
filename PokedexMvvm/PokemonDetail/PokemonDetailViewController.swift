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
    
    override func viewDidLoad() {
        viewModel.createSpecField()
        viewModel.createStatsField()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailView.showBottomView()
    }
    
    private func setupPageController() {
        detailView.pokemonDetailContainerView.scrollView.delegate = self
        detailView.pokemonDetailContainerView.pageController.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        
    }
    
    @objc func pageControlValueChanged(_ sender: UIPageControl) {
        let pageIndex = sender.currentPage
        let xOffset = detailView.pokemonDetailContainerView.scrollView.frame.size.width * CGFloat(pageIndex)
        detailView.pokemonDetailContainerView.scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
      }
    
    @objc private func updateView() {
        detailView.showBottomView()
        detailView.updateConstraints()
        detailView.layoutIfNeeded()
    }
    
}
extension PokemonDetailViewController: PokemonDetailViewModelDelegate {
    func setPokemonSpecs(for specs: [PokemonDetailSpecModel]) {
        detailView.pokemonDetailContainerView.addDetails(detailList: specs)
    }
    
    func setPokemonStats(for specs: [PokemonDetailSpecModel]) {
        detailView.pokemonDetailContainerView.addDetails(detailList: specs)
    }
    
    func setPokemonView(for pokemon: PokemonDetail) {
        detailView.setView(pokemon: pokemon)
        debugPrint("setView")
    }
}

extension PokemonDetailViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        detailView.pokemonDetailContainerView.pageController.currentPage = Int(pageNumber)
    }
}
