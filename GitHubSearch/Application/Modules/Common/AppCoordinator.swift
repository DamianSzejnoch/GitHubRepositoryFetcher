//
//  AppCoordinator.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    private let factory: DIContainer
    var controller: AppRootViewController
    
    init(window: UIWindow,
         factory: DIContainer) {
        self.window = window
        self.factory = factory
        self.controller = factory.appRootViewController()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
    override func start() {
        route()
    }
}

// MARK: - Routing
extension AppCoordinator {
    private func route() {
        let coordinator = RepositoriesListCoordinator(factory: factory)
        coordinator.start()
        self.addDependency(coordinator)
        controller.set(childViewController: coordinator.rootViewController)
    }
}
