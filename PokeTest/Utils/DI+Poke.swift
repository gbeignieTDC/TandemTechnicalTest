//
//  DI+Poke.swift
//  PokeTest
//
//  Created by Tandem on 21.05.2025.
//

extension DIContainer {
    var pokeService: DIFactory<PokeService> {
        self { PokeService() }
            .strong()
    }
}
