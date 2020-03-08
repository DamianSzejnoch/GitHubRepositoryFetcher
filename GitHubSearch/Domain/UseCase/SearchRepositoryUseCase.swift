//
//  SearchRepositoryUseCase.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol SearchRepositoriesUseCaseType {
    func searchGitHubRepositories(request: RepositoryQuery,completion: @escaping CompletionHandler)
}

class SearchRepositoryUseCase: SearchRepositoriesUseCaseType {
    
    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let gitHubRepository: GitHubRepositoryType
    
    init(gitHubRepository: GitHubRepositoryType) {
        self.gitHubRepository = gitHubRepository
    }
    
    // MARK: - Methods
    func searchGitHubRepositories(request: RepositoryQuery,completion: @escaping CompletionHandler) {
        gitHubRepository.fetchRepos(query: request, completion: completion)
    }
}
