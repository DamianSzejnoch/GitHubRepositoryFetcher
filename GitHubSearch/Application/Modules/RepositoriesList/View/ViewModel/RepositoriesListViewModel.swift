//
//  RepositoriesListViewModel.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum RepositoriesListLoadingType {
    case none
    case loading
    case loaded
}

protocol RepositoriesListViewModeInput {
    func search(query: String)
    func cancelSearch()
}
protocol RepositoriesListViewModelOutput {
    var items: BehaviorRelay<[RepositoryModel]> { get set }
    var loadingType: BehaviorRelay<RepositoriesListLoadingType> { get set }
}

protocol RepositoriesViewModelType:  RepositoriesListViewModelOutput, RepositoriesListViewModeInput {}

class RepositoriesViewModel: RepositoriesViewModelType {
    
    
    // MARK: - Data
    var items = BehaviorRelay<[RepositoryModel]>(value: [])
    var loadingType = BehaviorRelay<RepositoriesListLoadingType>(value: .none)
    
    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let searchRepositoriesUseCase: SearchRepositoriesUseCaseType
    
    init(searchRepositoriesUseCase: SearchRepositoriesUseCaseType) {
        self.searchRepositoriesUseCase = searchRepositoriesUseCase
    }
    
    // MARK: - Input
    func search(query: String) {
        let query = RepositoryQuery(searchValue: query)
        searchRepositoriesUseCase.searchGitHubRepositories(request: query) { (data, error) in
            if error != nil  {
                print(error)
            } else {
                var repositories = [RepositoryModel]()
                guard let decoded = JsonResponseDecoder.decodeJSON(type: Repository.self, from: data) else { return }
                decoded.items?.forEach({ (item) in
                    let repository = RepositoryModel(name: item.name ?? "",
                                                     language: item.language ?? "",
                                                     url: item.htmlUrl ?? "",
                                                     stars: String(item.stars ?? 0),
                                                     imageURL: item.owner?.avatarURL ?? "")
                    repositories.append(repository)
                })
                self.items.accept(self.items.value + repositories)
            }
        }
    }
    
    func cancelSearch() {
        self.items.accept([])
    }
}



