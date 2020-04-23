//
//  AppCoordinator.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 22.04.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    
    private let navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let searchMovieCoordinator = SearchMovieCoordinator(navigationController: navigationController)
        add(coordinator: searchMovieCoordinator)
        searchMovieCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
