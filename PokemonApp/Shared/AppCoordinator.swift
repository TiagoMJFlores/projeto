//
//  AppCoordinator.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import UIKit


struct AppCoordinator {
 
    let window: UIWindow
    let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
    }
    
    func start() {
        
        var pokemonListCoordinator = PokemonListCoordinator(navigationController: navigationController)
        pokemonListCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}
