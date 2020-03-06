//
//  GitHubRepositoryAssembly.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Swinject

class GitHubRepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GitHubRepositoryType.self) { (resolver: Resolver) in
            guard let networking = resolver.resolve(HTTPNetworking.self) else { fatalError() }
            return GitHubRepository(networking: networking)
        }
    }
}
