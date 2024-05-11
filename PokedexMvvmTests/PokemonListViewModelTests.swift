//
//  PokemonListViewModelTests.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import XCTest
import Alamofire
@testable import PokedexMvvm

class PokemonListViewModelTests: XCTestCase {
    
    var viewModel: PokemonListViewModel!
    var mockService: PokemonServiceSpy!
    var mockDelegate: MockPokemonListViewModelDelegate!

    override func setUp() {
        super.setUp()
        mockService = PokemonServiceSpy()
        mockDelegate = MockPokemonListViewModelDelegate()
        viewModel = PokemonListViewModel()
        viewModel.service = mockService
        viewModel.delegate = mockDelegate
    }

    override func tearDown() {
        mockService.shouldReturnError = false
        viewModel = nil
        mockService = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    // MARK: - Test retrieveCompleteList
    
    func testRetrieveCompleteList_Success() {
        mockService.shouldReturnError = false
        viewModel.retrieveCompleteList()
        
        XCTAssertFalse(mockDelegate.showErrorViewCalled)
    }
    
    func testRetrieveCompleteList_Failure() {
        mockService.shouldReturnError = true
        viewModel.service = mockService
        viewModel.retrieveCompleteList()
        
        XCTAssertTrue(mockDelegate.showErrorViewCalled)
        XCTAssertFalse(mockDelegate.updateListCalled)
        XCTAssertFalse(mockDelegate.hideErrorViewCalled)
    }
    
    // MARK: - Test searchList
    
    func testSearchList_Success() {
        mockService.shouldReturnError = false
        viewModel.service = mockService
        viewModel.searchList(for: "some_url")
        
        XCTAssertTrue(mockDelegate.updateListCalled)
        XCTAssertFalse(mockDelegate.showErrorViewCalled)
        XCTAssertTrue(mockDelegate.hideErrorViewCalled)
    }
    
    func testSearchList_Failure() {
        mockService.shouldReturnError = true
        viewModel.service = mockService
        viewModel.searchList(for: "some_url")
        
        XCTAssertTrue(mockDelegate.showErrorViewCalled)
        XCTAssertTrue(mockDelegate.updateListCalled)
        XCTAssertFalse(mockDelegate.hideErrorViewCalled)
    }
    
    func testSetSaved_ForSave() {
        mockService.shouldReturnError = false
        viewModel.service = mockService
        viewModel.retrieveCompleteList()
        viewModel.favoriteManager = FavoriteManagerSpy()
        
        viewModel.setSaved(index: 0)
        XCTAssertTrue(viewModel.sortedList[0].isFav ?? false)
        XCTAssertTrue(mockDelegate.updateListCalled)
    }
    
    func testSetSaved_ForRemove() {
        mockService.shouldReturnError = false
        viewModel.service = mockService
        viewModel.retrieveCompleteList()
        viewModel.favoriteManager = FavoriteManagerSpy()
        viewModel.sortedList[0].isFav = true
        viewModel.setSaved(index: 0)
        XCTAssertFalse(viewModel.sortedList[0].isFav ?? true)
        XCTAssertTrue(mockDelegate.updateListCalled)
    }
    
    func testCheckForFavorites() {
        mockService.shouldReturnError = false
        viewModel.service = mockService
        viewModel.retrieveCompleteList()
        viewModel.favoriteManager = FavoriteManagerSpy()
        viewModel.setSaved(index: 0)
        viewModel.sortedList[0].isFav = false
        viewModel.checkForFavorites(pokemons: &viewModel.sortedList)
        XCTAssertTrue(viewModel.sortedList[0].isFav ?? false)
    }
}



class MockPokemonListViewModelDelegate: PokemonListViewModelDelegate {
    var updateListCalled = false
    var showErrorViewCalled = false
    var hideErrorViewCalled = false

    func updateList() {
        updateListCalled = true
    }

    func showErrorView() {
        showErrorViewCalled = true
    }

    func hideErrorView() {
        hideErrorViewCalled = true

    }
}
