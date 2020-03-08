//
//  ViewModelAssembly.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(RepositoriesViewModelType.self) { r in
             guard let searchRepositoriesUseCase = r.resolve(SearchRepositoriesUseCaseType.self) else { fatalError() }
            return RepositoriesViewModel(searchRepositoriesUseCase: searchRepositoriesUseCase)
        }
    }
}
