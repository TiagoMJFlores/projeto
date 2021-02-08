//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import Foundation
import UIKit

class PokemonDetailViewController: UIViewController {

    var imageDownloader = ImageDownloader()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
       view.addSubview(imageView)
       imageView.contentMode = .scaleAspectFit
       return imageView
    }()
   
   
    private let presenter: PokemonDetailPresenterProtocol
    
    init(presenter: PokemonDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        configureLayout()
        presenter.viewLayerLoaded()
    }
    
    private func configureLayout() {
  
        tableView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
             imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            tableView.topAnchor.constraint(equalTo:  imageView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        let bottomVerticalConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomVerticalConstraint.priority = UILayoutPriority(rawValue: 800)
        bottomVerticalConstraint.isActive = true
        
    }
    

}


//MARK: UITableViewDataSource
extension PokemonDetailViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberItems()
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.selectionStyle = .none
    guard let (caption, value) = presenter.item(at: indexPath) else {
        return UITableViewCell()
    }
    cell.textLabel?.text = "\(caption): \(value) " // items[indexPath.row]
    return cell
  }
    
}

//MARK: UITableViewDelegate
extension PokemonDetailViewController:  UITableViewDelegate {
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if imageView.frame.size.height <= 0 {
            return
        }
        let scale =  1 - abs(scrollView.contentOffset.y)  / scrollView.frame.size.height
        view.setNeedsLayout()
        self.imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    

}

// MARK: PokemonDetailViewReceiver
extension PokemonDetailViewController: PokemonDetailViewReceiver {
    
    func showPokemonInfo(pokemonInfo: PokemonDetailInfo) {
        let sprite = pokemonInfo.sprites.frontDefault
        self.imageDownloader.downloadImage(from: sprite, toImageView: self.imageView)
    }
}
