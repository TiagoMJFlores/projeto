//
//  ViewController.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import UIKit

class PokemonListViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    
    let presenter: PokemonListPresenterProtocol
    
    init(presenter: PokemonListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        presenter.viewLayerLoaded()
    }

}


// MARK: UITableViewDataSource
extension PokemonListViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberItems()
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PokemonListTableViewCell else {
        return UITableViewCell()
    }
    
  
    if let detailPresenter =  presenter.item(at: indexPath) {
        cell.configure(with: detailPresenter)
    }
   
   // cell.imageView?.image = UIImage(named: "dd")
    return cell
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


// MARK: UITableViewDelegate
extension PokemonListViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: row, animated: true)
        }
        presenter.didSelectRow(at: indexPath)
    }
    
}


// MARK: PokemonListViewReceiver
extension PokemonListViewController: PokemonListViewReceiver {
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
