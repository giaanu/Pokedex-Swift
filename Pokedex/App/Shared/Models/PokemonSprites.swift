//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 14/06/2022.
//

import Foundation

struct PokemonSprites: Codable {
    let other: SpriteOther?
}

struct SpriteOther: Codable {
    let home: SpriteHome?
}

struct SpriteHome: Codable {
    let frontDefault: String?
}
