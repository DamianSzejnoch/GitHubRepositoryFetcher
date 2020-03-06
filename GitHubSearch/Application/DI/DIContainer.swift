//
//  DIContainer.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Swinject

final class DIContainer {
    //MARK: - Public
    static let shared = DIContainer()
    
    let assembler: Assembler
    let container: Container
    
    //MARK: - Lifecycle
    init() {
        container = Container()
        assembler = Assembler([
            ViewControllerAssembly(),
            ViewModelAssembly(),
            GitHubRepositoryAssembly(),
            NetworkingAssembly(),
            UseCaseAssembly()
        ], container: container)
    }
}

