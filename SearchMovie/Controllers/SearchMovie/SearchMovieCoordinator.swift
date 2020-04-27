//
//  SearchMovieCoordinator.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 4/15/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit

class SearchMovieCoordinator: BaseCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let view = SearchMovieViewController.instantiate()

        view.viewModelBuilder = {
            SearchMovieViewModel.init(input: $0,
                                      searchMovieService: SearchMovieService.shated)
        }
        navigationController.pushViewController(view, animated: true)
    }
}
