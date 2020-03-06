//
//  UseCaseAssembly.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Swinject

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SearchRepositoriesUseCaseType.self) { (resolver: Resolver) in
            guard let gitHubRepository = resolver.resolve(GitHubRepositoryType.self) else { fatalError() }
            return SearchRepositoryUseCase(gitHubRepository: gitHubRepository)
        }
    }
}
