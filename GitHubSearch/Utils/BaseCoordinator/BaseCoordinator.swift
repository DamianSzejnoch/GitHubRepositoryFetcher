//
//  BaseCoordinator.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation

import Foundation

protocol CoordinatorFinishOutput {
    var finishflow: (() -> Void)? { get set }
}

protocol Coordinator: class {
    func start()
}

class BaseCoordinator: Coordinator {

func start() {
    
}
        
    var childCoordinators = [Coordinator]()
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
