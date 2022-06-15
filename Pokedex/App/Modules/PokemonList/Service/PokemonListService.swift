//
//  PokemonListService.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 09/06/2022.
//

import Foundation
import SwiftUI

class PokemonListService{
    
    func getPokemons(onComplete: @escaping([Pokemon]) -> Void, onError: @escaping() -> Void){
        
        ApiManager.shared.get(url: Constants().PokemonListURL) { response in
            
            switch response {
                case.success(let data):
                    do{
                        if let data = data {
                            let decoder = JSONDecoder()
                            let pokemonResponse = try decoder.decode(PokemonResponse.self, from: data)
                            onComplete(pokemonResponse.results)
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
