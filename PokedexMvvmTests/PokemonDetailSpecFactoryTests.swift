//
//  PokemonDetailSpecFactoryTests.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//

import XCTest
import Alamofire
@testable import PokedexMvvm

class PokemonDetailSpecFactoryTests: XCTestCase {
    
    func testBuildSpecList() {
        let pokemonMock = PokemonMock().getPokemon()
        let specs =  PokemonDetailSpecFactory.buildSpecList(for: pokemonMock)
        XCTAssertEqual(specs[0].value, pokemonMock.types[0].type.name.rawValue)
        XCTAssertEqual(specs[1].value, pokemonMock.types[1].type.name.rawValue)
        XCTAssertEqual(specs[2].value, pokemonMock.abilities[0].ability.name)
        XCTAssertEqual(specs[3].value, pokemonMock.abilities[1].ability.name)
        XCTAssertEqual(specs[4].value, String(pokemonMock.weight))
        XCTAssertEqual(specs[5].value, String(pokemonMock.height))
        
        
    }
    
    func testBuildStatList() {
        let pokemonMock = PokemonMock().getPokemon()
        let stats =  PokemonDetailSpecFactory.buildStats(for: pokemonMock)
        
        XCTAssertEqual(stats[0].value, String(pokemonMock.stats[0].value))
        XCTAssertEqual(stats[1].value, String(pokemonMock.stats[1].value))
        XCTAssertEqual(stats[2].value, String(pokemonMock.stats[2].value))
        XCTAssertEqual(stats[3].value, String(pokemonMock.stats[3].value))
        XCTAssertEqual(stats[4].value, String(pokemonMock.stats[4].value))
        XCTAssertEqual(stats[5].value, String(pokemonMock.stats[5].value))
    }
    
    
}
