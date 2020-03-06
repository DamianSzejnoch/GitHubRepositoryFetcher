//
//  ViewControllerAssembly.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//
import Foundation
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppRootViewController.self) { _ in
                   return AppRootViewController()
               }
        container.register(RepositoriesListViewController.self) { (resolver: Resolver) in
            guard let viewModel = resolver.resolve(RepositoriesViewModelType.self) else { fatalError() }
            return RepositoriesListViewController(viewModel: viewModel)
        }
        
    }
}
