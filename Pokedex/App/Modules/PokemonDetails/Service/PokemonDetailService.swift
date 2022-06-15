//
//  PokemonDetailService.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 14/06/2022.
//

import Foundation

class PokemonDetailService{
    
    func getPokemon(url: String, onComplete: @escaping(PokemonDetail) -> Void, onError: @escaping() -> Void){
        
        ApiManager.shared.get(url: url) { response in
            
            switch response {
                case.success(let data):
                    do{
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let pokemonResponse = try decoder.decode(PokemonDetail.self, from: data)
                            onComplete(pokemonResponse)
                        }
                    } catch {
                        onError()
                    }
                case.failure(_):
                    onError()
            }
        }
        
    }
}
