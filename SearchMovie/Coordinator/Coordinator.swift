//
//  Cootdinator.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 4/15/20.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

protocol Coordinator: class {
    var childCoordinator: [Coordinator] {get set}
    func start()
}

extension Coordinator {
    
    func add(coordinator: Coordinator) -> Void {
        childCoordinator.append(coordinator)
    }

    func remove(coordinator: Coordinator) -> Void {
        childCoordinator = childCoordinator.filter({$0 !== coordinator})
    }
}
