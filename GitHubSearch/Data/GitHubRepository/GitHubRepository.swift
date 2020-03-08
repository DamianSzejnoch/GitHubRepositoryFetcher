//
//  GitHubRepository.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import Alamofire

class GitHubRepository: GitHubRepositoryType {
    
    //MARK: Private
    private let networking: HTTPNetworking
    
    init(networking: HTTPNetworking) {
        self.networking = networking
    }
    
    // Methods
    func fetchRepos(query: RepositoryQuery, completion: @escaping CompletionHandler) {
        let query = Query(endPoint: GitHubRepositoryAPI.repos, queryParameters: ["q": query.searchValue])
        networking.request(query: query, completion: completion)
    }
}
