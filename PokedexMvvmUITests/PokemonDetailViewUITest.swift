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
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
        
        let elementsQuery = app.scrollViews.otherElements.scrollViews.otherElements
        elementsQuery.otherElements["type 1, grass"].tap()
        elementsQuery.otherElements["type 2, poison"].tap()
        elementsQuery.otherElements["ability 1, overgrow"].tap()
        elementsQuery.otherElements["ability 2, chlorophyll"].tap()
        
        let weight69Element = elementsQuery.otherElements["weight, 69"]
        weight69Element.tap()
        weight69Element.swipeUp()
        elementsQuery.otherElements["height, 7"].tap()
        weight69Element.swipeLeft()
        elementsQuery.otherElements["hp, 45"].tap()
        elementsQuery.otherElements["attack, 49"].tap()
        elementsQuery.otherElements["defense, 49"].tap()
        elementsQuery.otherElements["special attack, 65"].tap()
        elementsQuery.otherElements["special defense, 65"].tap()
        
      
    }
    
    

    // Add more UI tests as needed
}
