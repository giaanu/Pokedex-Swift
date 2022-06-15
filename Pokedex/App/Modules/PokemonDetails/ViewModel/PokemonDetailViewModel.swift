//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 15/06/2022.
//

import Foundation

class PokemonDetailViewModel {
    
    private var delegate: PokemonDetailDelegate
    private var service: PokemonDetailService
    private var url: String
    
    init (url: String, service: PokemonDetailService, delegate: PokemonDetailDelegate) {
        self.url = url
        self.service = service
        self.delegate = delegate
    }
    
    func getPokemon	(){
        
        service.getPokemon(url: url){ pokemon in
            self.delegate.pokemonData(pokemon: pokemon)
        } onError: {
            self.delegate.showError()
        }
        
    }
}
