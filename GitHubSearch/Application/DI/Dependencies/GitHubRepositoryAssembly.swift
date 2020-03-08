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
        container.register(GitHubRepositoryType.self) { r in
            guard let networking = r.resolve(HTTPNetworking.self) else { fatalError() }
            return GitHubRepository(networking: networking)
        }
    }
}
