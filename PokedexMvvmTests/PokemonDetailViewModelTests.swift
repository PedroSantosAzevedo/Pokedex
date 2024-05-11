//
//  PokemonDetailViewModelTests.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//


import XCTest
import Alamofire
@testable import PokedexMvvm

class PokemonDetailViewModelTests: XCTestCase {
    
    var viewModel: PokemonDetailViewModel!
    var mockDelegate: MockPokemonDetailViewModelDelegate!
    var mockPokemonDetail: PokemonDetail!

    override func setUp() {
        super.setUp()
        mockDelegate = MockPokemonDetailViewModelDelegate()
        mockPokemonDetail = PokemonMock().getPokemon()
        viewModel = PokemonDetailViewModel(pokemon: mockPokemonDetail)
        viewModel.delegate = mockDelegate
    }

    override func tearDown() {
        viewModel = nil
        mockDelegate = nil
        mockPokemonDetail = nil
        super.tearDown()
    }
    
    // MARK: - Test setPokemonView
    
    func testSetPokemonView() {
        viewModel.setPokemonView()

        XCTAssertTrue(mockDelegate.setPokemonViewCalled)
        XCTAssertEqual(mockDelegate.pokemonPassedToSetView, mockPokemonDetail)
    }
    
    // MARK: - Test createSpecField
    
    func testCreateSpecField() {
        viewModel.createSpecField()
        
        XCTAssertTrue(mockDelegate.setPokemonSpecsCalled)
        
    }
    
    // MARK: - Test createStatsField
    
    func testCreateStatsField() {
        viewModel.createStatsField()
        XCTAssertTrue(mockDelegate.setPokemonStatsCalled)
        for i in 0..<PokemonMock().getPokemon().stats.count {
            guard let mockDetail = mockDelegate.pokemonDetailSpecs[safe: i], let detail = PokemonMock().getPokemon().stats[safe: i] else { return }
            XCTAssertEqual(mockDetail.value, String(detail.value))
        }
    }
    
    
}

// MARK: - Mocks

class MockPokemonDetailViewModelDelegate: PokemonDetailViewModelDelegate {
    var setPokemonViewCalled = false
    var setPokemonSpecsCalled = false
    var setPokemonStatsCalled = false
    var pokemonPassedToSetView: PokemonDetail?
    var pokemonDetailSpecs: [PokemonDetailSpecModel] = []

    func setPokemonView(for pokemon: PokemonDetail) {
        setPokemonViewCalled = true
        pokemonPassedToSetView = pokemon
    }

    func setPokemonSpecs(for specs: [PokemonDetailSpecModel]) {
        setPokemonSpecsCalled = true
        pokemonDetailSpecs = specs
    }

    func setPokemonStats(for specs: [PokemonDetailSpecModel]) {
        setPokemonStatsCalled = true
        pokemonDetailSpecs = specs
    }
}
