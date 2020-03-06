//
//  DIContainer + Extensions.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation

extension DIContainer {
    func appRootViewController() -> AppRootViewController {
        guard let controller = container.resolve(AppRootViewController.self) else { fatalError() }
        return controller
    }
    
    func RepositoriesList() -> RepositoriesListViewController {
        guard let controller = container.resolve(RepositoriesListViewController.self) else { fatalError() }
        return controller
    }
}
