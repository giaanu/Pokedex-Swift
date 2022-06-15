//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 10/06/2022.
//

import Foundation

class PokemonListViewModel {
    
    private var service: PokemonListService
    private var pokemons = [Pokemon]()
    private var delegate: PokemonListDelegate
    init(service: PokemonListService, delegate: PokemonListDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    func getPokemons(){
        self.delegate.toogleLoading()
        
        service.getPokemons { pokemons in
            self.delegate.toogleLoading()
            self.pokemons = pokemons
            self.delegate.reloadTable()
        } onError: {
            self.delegate.showError()
        }
    }
 
    func getPokemonm(at index: Int) -> Pokemon {
        return pokemons[index]
    }
 
    func getPokemonCount() -> Int {
        return pokemons.count
    }
}
