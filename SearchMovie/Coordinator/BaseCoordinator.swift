//
//  BaseCoordinator.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 4/15/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    func start() {
        fatalError("need implemet start")
    }
    
}
