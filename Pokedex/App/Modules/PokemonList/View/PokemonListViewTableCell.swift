//
//  PokemonListViewTableCell.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 13/06/2022.
//

import UIKit

class PokemonListViewTableCell: UITableViewCell {
    
    var name: String? {
        didSet{
            pokemonName.text = name
        }
    }
    
    private lazy var placeHolderImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 30
        aImage.backgroundColor = .white
        aImage.image = UIImage(named: "pokeball.imageset")
        return aImage
        
    }()
    
    private lazy var pokemonName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .lightGray
        return aLabel
    }()
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not ben implemented")
    }
    
    private func setupView() {
        contentView.addSubview(placeHolderImage)
        contentView.addSubview(pokemonName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            placeHolderImage.heightAnchor.constraint(equalToConstant: 60),
            placeHolderImage.widthAnchor.constraint(equalToConstant: 60),
            
            placeHolderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placeHolderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            placeHolderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            pokemonName.leadingAnchor.constraint(equalTo: placeHolderImage.trailingAnchor, constant: 16),
            pokemonName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pokemonName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            pokemonName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
            
        ])
    }
}
