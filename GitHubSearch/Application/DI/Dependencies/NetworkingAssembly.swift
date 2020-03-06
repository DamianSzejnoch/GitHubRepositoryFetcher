//
//  NetworkingAssembly.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Swinject

class NetworkingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HTTPNetworking.self) { _ in
            return HTTPNetworking()
        }
    }
}
