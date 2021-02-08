//
//  PokemonListCoordinator.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import UIKit

protocol PokemonListCoordinatorProtocol: CoordinatorProtocol {
    func presentDetail(detailPresenter: PokemonDetailPresenter)
}


struct PokemonListCoordinator: PokemonListCoordinatorProtocol {
        
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let coordinator = PokemonListCoordinator(navigationController: self.navigationController)
        let presenter = PokemonListPresenter(coordinator: coordinator)
    
        let view = PokemonListViewController(presenter: presenter)
        presenter.view = view
        navigationController.pushViewController(view, animated: true)
       
        /*
        boutiqueListCoordinator = AppCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        boutiqueListCoordinator?.start()
 */
    }
    
    func presentDetail(detailPresenter: PokemonDetailPresenter) {
        let detailCoordinator = PokemonDetailCoordinator(detailPresenter: detailPresenter, navigationController: self.navigationController)
        detailCoordinator.start()
        //
    }
    
}
