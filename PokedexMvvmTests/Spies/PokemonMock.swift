//
//  PokemonMock.swift
//  PokedexMvvmTests
//
//  Created by Pedro Azevedo on 11/05/24.
//

@testable import PokedexMvvm

class PokemonMock {
   func getPokemon() -> PokemonDetail {
       let types = [PokemonType.init(slot: 0, type: PokemonTypeSlot.init(name: .normal, url: "")), PokemonType.init(slot: 1, type: PokemonTypeSlot.init(name: .fire, url: ""))]
       let abilities = [Ability.init(ability: .init(name: "ember", url: "")), Ability.init(ability: .init(name: "fire blast", url: ""))]
       
       let stats = [Stat.init(stat: StatSlot.init(name: .attack, url: ""), value: 64),Stat.init(stat: StatSlot.init(name: .defense, url: ""), value: 323),Stat.init(stat: StatSlot.init(name: .hp, url: ""), value: 57),Stat.init(stat: StatSlot.init(name: .specialAttack, url: ""), value: 420),Stat.init(stat: StatSlot.init(name: .specialDefense, url: ""), value: 10),Stat.init(stat: StatSlot.init(name: .speed, url: ""), value: 8)]
       
       return PokemonDetail.init(id: 1, name: "ditto", weight: 5, height: 64, baseExperience: 420, sprite: .init(url: "", other: .init(dreamSprite: .init(url: ""))), types: types, abilities: abilities, stats: stats)
   }
}
