//
//  PokemonDetailViewUITest.swift
//  PokedexMvvmUITests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import XCTest
@testable import PokedexMvvm

class PokemonDetailViewUITest: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testPokemonListViewLayout() throws {
        
        let app = XCUIApplication()
        app.staticTexts["Bulbasaur"].tap()
        
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).tap()
        element.children(matching: .other).element(boundBy: 1).tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let type1GrassElement = elementsQuery.otherElements["type 1, grass"]
        type1GrassElement.tap()
        type1GrassElement.tap()
        elementsQuery.otherElements["type 2, poison"].tap()
        elementsQuery.otherElements["ability 1, overgrow"].tap()
        
        let ability2ChlorophyllElement = elementsQuery.otherElements["ability 2, chlorophyll"]
        ability2ChlorophyllElement.tap()
        elementsQuery.otherElements["weight, 69"].tap()
        elementsQuery.otherElements["height, 7"].tap()
        ability2ChlorophyllElement.swipeLeft()
        elementsQuery.otherElements["hp, 45"].tap()
        elementsQuery.otherElements["attack, 49"].tap()
        elementsQuery.otherElements["defense, 49"].tap()
        
        let specialAttack65Element = elementsQuery.otherElements["special attack, 65"]
        specialAttack65Element.tap()
        elementsQuery.otherElements["special defense, 65"].tap()
        elementsQuery.otherElements["speed, 45"].tap()
        specialAttack65Element.swipeRight()
        app.navigationBars["PokedexMvvm.PokemonDetailView"].buttons["Back"].tap()
      
        
    }
    
    

    // Add more UI tests as needed
}
