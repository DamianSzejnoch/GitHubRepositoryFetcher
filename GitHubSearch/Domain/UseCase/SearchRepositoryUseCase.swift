//
//  SearchRepositoryUseCase.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation

protocol SearchRepositoriesUseCaseType {
    typealias Completion = (Result<[RepositoryModel], Error>) -> Void
    func searchGitHubRepositories(request: RepositoryQuery,completion: @escaping Completion)
}

class SearchRepositoryUseCase: SearchRepositoriesUseCaseType {
    
    // MARK: - Private
    private let gitHubRepository: GitHubRepositoryType
    
    init(gitHubRepository: GitHubRepositoryType) {
        self.gitHubRepository = gitHubRepository
    }
    
    // MARK: - Methods
    func searchGitHubRepositories(request: RepositoryQuery,completion: @escaping Completion) {
        gitHubRepository.fetchRepos(query: request, completion: completion)
    }
}
