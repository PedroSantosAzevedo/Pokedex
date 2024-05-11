//
//  PokemonListViewUITests.swift
//  PokedexMvvmUITests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import XCTest
@testable import PokedexMvvm

class PokemonListViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testPokemonListViewLayout() throws {
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.staticTexts["titleLabel"]/*[[".staticTexts[\"Pokedex\"]",".staticTexts[\"titleLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tablesQuery2 = app.tables
                let tablesQuery = tablesQuery2
        tablesQuery2.cells.containing(.other, identifier:"Charmeleon, nº5").element.swipeDown()
        
        let searchField = app.otherElements["searchBar"].children(matching: .other).element.children(matching: .searchField).element
        searchField.tap()
        searchField.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Cancel"]/*[[".otherElements[\"searchBar\"]",".buttons[\"Cancel\"].staticTexts[\"Cancel\"]",".staticTexts[\"Cancel\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.otherElements["Bulbasaur, nº1"]/*[[".cells.otherElements[\"Bulbasaur, nº1\"]",".otherElements[\"Bulbasaur, nº1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["PokedexMvvm.PokemonDetailView"].buttons["Back"].tap()
        
    }
    
    

    // Add more UI tests as needed
}
