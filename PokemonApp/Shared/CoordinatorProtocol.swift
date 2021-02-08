//
//  CoordinatorProtocol.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import UIKit

protocol CoordinatorProtocol {
    
    var navigationController: UINavigationController { get set }
    func start()
}
