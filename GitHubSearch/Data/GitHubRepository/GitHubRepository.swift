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
    func fetchRepos(query: RepositoryQuery, completion: @escaping Completion) {
        let query = Query(endPoint: GitHubRepositoryAPI.repos, queryParameters: ["q": query.searchValue])
        networking.request(query: query) { (data, error) in
            let decoded = JsonResponseDecoder.decodeJSON(type: Repository.self, from: data)
            
            if let error = error {
                completion(.failure(error))
            } else {
                var repositories = [RepositoryModel]()
                decoded?.items?.forEach({
                    let repositoryModel = RepositoryModel(name: $0.name ?? "", language: $0.language ?? "", url: $0.htmlUrl ?? "", stars: String($0.stars ?? 0) , imageURL: $0.owner?.avatarURL ?? "")
                    repositories.append(repositoryModel)
                })
                completion(.success(repositories))
            }
        }
    }
    
}
