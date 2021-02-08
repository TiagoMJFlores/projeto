//
//  PokemonDetailCoordinator.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import UIKit

struct PokemonDetailCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    let detailPresenter: PokemonDetailPresenter
    
    init(detailPresenter: PokemonDetailPresenter, navigationController: UINavigationController) {
        self.detailPresenter = detailPresenter
        self.navigationController = navigationController
    }
    
    func start() {
        let view = PokemonDetailViewController(presenter: detailPresenter)
        detailPresenter.view = view
        navigationController.pushViewController(view, animated: true)
    }
    
}
