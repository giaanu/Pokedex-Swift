//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 10/06/2022.
//

import UIKit

protocol PokemonListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}

class PokemonListViewController: UIViewController {
    
    private var service = PokemonListService()
    private var viewModel: PokemonListViewModel?
    
    private lazy var tableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        viewModel = PokemonListViewModel(service: service, delegate: self)
        viewModel?.getPokemons()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        title = "Lista de Pokemones"
        self.view.backgroundColor = .lightGray
        self.view.addSubview(tableView)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PokemonListViewTableCell.self, forCellReuseIdentifier: String(describing: PokemonListViewTableCell.self))
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = self.viewModel?.getPokemonm(at: indexPath.row)
        let vc = PokemonDetailViewController()
        vc.url = pokemon?.url ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.getPokemonCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListViewTableCell.self)) as? PokemonListViewTableCell else {
            return UITableViewCell()
        }
        
        let pokemon = viewModel?.getPokemonm(at: indexPath.row)
        cell.name = pokemon?.name
        return cell
    }
}

extension PokemonListViewController: PokemonListDelegate {
    func toogleLoading() {
        print("acaba deberia mostrar un loading")
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showError() {
        print("ohh ha ocurrido un error")
    }
    
    
}
