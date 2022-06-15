//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 14/06/2022.
//

import Foundation
struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let sprites: PokemonSprites
}
