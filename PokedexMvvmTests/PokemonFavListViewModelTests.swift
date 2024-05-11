//
//  PokemonFavListViewModelTests.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import XCTest
import Alamofire
@testable import PokedexMvvm

class PokemonFavListViewModelTests: XCTestCase {
    
    var viewModel: PokemonFavListViewModel!
    var mockDelegate: MockPokemonListViewModelDelegate!
    var saveManager: FavoriteManagerSpy!
    override func setUp() {
        super.setUp()
        mockDelegate = MockPokemonListViewModelDelegate()
        viewModel = PokemonFavListViewModel()
        saveManager = FavoriteManagerSpy()
        viewModel.favoriteManager = saveManager
        viewModel.delegate = mockDelegate
    }
    
    override func tearDown() {
        viewModel = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    
    func testRetrieveCompleteList_NotEmpty() {
        saveManager.saveModels([PokemonMock().getPokemon()])
        viewModel.retrieveCompleteList()
        XCTAssertFalse(mockDelegate.showErrorViewCalled)
        XCTAssertFalse(viewModel.sortedList.isEmpty)
    }
    
    func testRetrieveCompleteList_Empty() {
        saveManager.favoriteModels = []
        viewModel.retrieveCompleteList()
        XCTAssertFalse(mockDelegate.showErrorViewCalled)
        XCTAssertTrue(viewModel.sortedList.isEmpty)
    }
    
    func testSearch_Success_Name() {
        saveManager.saveModels([PokemonMock().getPokemon()])
        viewModel.retrieveCompleteList()
        mockDelegate.hideErrorViewCalled = false
        mockDelegate.showErrorViewCalled = false
        viewModel.searchList(for: PokemonMock().getPokemon().name)
        XCTAssertTrue(viewModel.isSearching)
        XCTAssertFalse(viewModel.searchResult.isEmpty)
        XCTAssertFalse(mockDelegate.showErrorViewCalled)
        XCTAssertTrue(mockDelegate.hideErrorViewCalled)
    }
    
    func testSearch_Success_ID() {
        saveManager.saveModels([PokemonMock().getPokemon()])
        viewModel.retrieveCompleteList()
        mockDelegate.hideErrorViewCalled = false
        mockDelegate.showErrorViewCalled = false
        viewModel.searchList(for: "\(PokemonMock().getPokemon().id)")
        XCTAssertTrue(viewModel.isSearching)
        XCTAssertFalse(viewModel.searchResult.isEmpty)
        XCTAssertFalse(mockDelegate.showErrorViewCalled)
        XCTAssertTrue(mockDelegate.hideErrorViewCalled)
    }
    
    func testSearch_Failure() {
        saveManager.saveModels([PokemonMock().getPokemon()])
        viewModel.retrieveCompleteList()
        mockDelegate.hideErrorViewCalled = false
        mockDelegate.showErrorViewCalled = false
        viewModel.searchList(for: "")
        XCTAssertTrue(viewModel.isSearching)
        XCTAssertTrue(viewModel.searchResult.isEmpty)
        XCTAssertTrue(mockDelegate.showErrorViewCalled)
        XCTAssertFalse(mockDelegate.hideErrorViewCalled)
    }
    
    func testGetSaved() {
        var pokemon = PokemonMock().getPokemon()
        pokemon.isFav = true
        saveManager.saveModels([pokemon])
        viewModel.retrieveCompleteList()
        viewModel.setSaved(index: 0)
        XCTAssertTrue(viewModel.sortedList.isEmpty)
    }
    
}

fileprivate class PokemonMock {
    func getPokemon() -> PokemonDetail {
        let types = [PokemonType.init(slot: 0, type: PokemonTypeSlot.init(name: .normal, url: "")), PokemonType.init(slot: 1, type: PokemonTypeSlot.init(name: .fire, url: ""))]
        let abilities = [Ability.init(ability: .init(name: "ember", url: "")), Ability.init(ability: .init(name: "fire blast", url: ""))]
        
        let stats = [Stat.init(stat: StatSlot.init(name: .attack, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .defense, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .hp, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .specialAttack, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .specialDefense, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .speed, url: ""), value: 64)]
        
        return PokemonDetail.init(id: 1, name: "ditto", weight: 5, height: 64, baseExperience: 420, sprite: .init(url: "", other: .init(dreamSprite: .init(url: ""))), types: types, abilities: abilities, stats: stats)
    }
}
