//
//  RepositoriesListCoordinator.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RepositoriesListCoordinator: Coordinator {
    
    let removeDependency = PublishSubject<Void>()
    
    // MARK: - Private
    private let router: RouterType
    private let factory: DIContainer
    private let repositoriesListViewController: RepositoriesListViewController
    var rootViewController: CoordinatorNavigationController
    
    // MARK: - Lifecycle
    init(factory: DIContainer) {
        self.factory = factory
        self.repositoriesListViewController = factory.RepositoriesList()
        self.rootViewController = CoordinatorNavigationController(rootViewController: repositoriesListViewController)
        self.router = Router(rootController: rootViewController)
    }
    
    func start() {
        
    }
}

extension RepositoriesListCoordinator {
    private func showRepositoriesList() {
        
    }
}

