//
//  PokemonListCoordinatorMock.swift
//  PokemonAppTests
//
//  Created by Tiago Flores on 07/02/2021.
//

import UIKit
@testable import PokemonApp

class PokemonListCoordinatorMock: PokemonListCoordinatorProtocol {
    
    var navigationController: UINavigationController = UINavigationController()
    
    
    var presentDetailCallback: (() -> (Void))?
    

    func presentDetail(detailPresenter: PokemonDetailPresenter) {
        presentDetailCallback?()
    }
    
  
    func start() {}
    
}
