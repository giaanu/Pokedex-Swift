//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 14/06/2022.
//

import Foundation
import UIKit

protocol PokemonDetailDelegate {
    func pokemonData(pokemon: PokemonDetail)
    func showError()
}

class PokemonDetailViewController: UIViewController {
    
    var url: String = ""
    private var service = PokemonDetailService()
    private var viewModel: PokemonDetailViewModel?
    private lazy var pokemonBackground: UIView = {
       let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        aView.layer.cornerRadius = 70
        aView.backgroundColor = .white.withAlphaComponent(0.4)
        return aView
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "pokedex.imageset")
        aImage.contentMode = .scaleAspectFill
        return aImage
    }()
    
    private lazy var pokemonImage: UIImageView = {
       let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.contentMode = .scaleAspectFit
        return aImage
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .lightGray
        aLabel.font = UIFont.systemFont(ofSize: 28)
        aLabel.textAlignment = .center
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PokemonDetailViewModel(url: url, service: service, delegate: self)
        viewModel?.getPokemon()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(backgroundImage)
        view.addSubview(pokemonBackground)
        view.addSubview(pokemonImage)
        view.addSubview(pokemonName)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 140),
            pokemonImage.widthAnchor.constraint(equalToConstant: 140),
            pokemonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pokemonName.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 22),
            
            pokemonBackground.heightAnchor.constraint(equalToConstant: 140),
            pokemonBackground.widthAnchor.constraint(equalToConstant: 140),
            pokemonBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pokemonBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
}


extension PokemonDetailViewController: PokemonDetailDelegate {
    func pokemonData(pokemon: PokemonDetail) {
        pokemonName.text = pokemon.name
        
        if let pokemonUrl = URL(string: pokemon.sprites.other?.home?.frontDefault ?? "") {
            pokemonImage.load(url: pokemonUrl)
        }
    }
    
    func showError() {
        print("Ha ocurrido un error)")
    }
    
    
}
