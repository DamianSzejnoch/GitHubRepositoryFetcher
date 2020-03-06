//
//  EndPoint.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//


protocol Endpoint {
  var path: String { get }
}

enum GitHubRepositoryAPI {
  case repos
}

extension GitHubRepositoryAPI: Endpoint {
  var path: String {
    switch self {
    case .repos: return "https://api.github.com/search/repositories?"
    }
  }
}



