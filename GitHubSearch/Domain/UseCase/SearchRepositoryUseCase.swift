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
    var response: BehaviorRelay<[RepositoryModel]> { get }
    func searchGitHubRepositories(request: RepositoryQuery)
}

class SearchRepositoryUseCase: SearchRepositoriesUseCaseType {
    
    // MARK: - Public
    var response = BehaviorRelay<[RepositoryModel]>(value: [])
    
    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let gitHubRepository: GitHubRepositoryType
    
    init(gitHubRepository: GitHubRepositoryType) {
        self.gitHubRepository = gitHubRepository
    }
    
    // MARK: - Methods
    func searchGitHubRepositories(request: RepositoryQuery) {
        var items = [RepositoryModel]()
        gitHubRepository.fetchRepos(query: request)
        gitHubRepository.responseCallBack.asObservable()
            .skip(1)
            .subscribe(onNext: { [weak self] repository in
            
                guard let self = self else { return }
                repository?.items?.forEach({ (item) in
                    let repository = RepositoryModel(name: item.name ?? "", language: item.language ?? "")
                    items.append(repository)
                })
            self.response.accept(items)
            }).disposed(by: disposeBag)
    }
}
