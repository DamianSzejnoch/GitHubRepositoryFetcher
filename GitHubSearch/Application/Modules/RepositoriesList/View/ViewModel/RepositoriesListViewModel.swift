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
    var error: BehaviorRelay<Error?> { get set }
}

protocol RepositoriesViewModelType:  RepositoriesListViewModelOutput, RepositoriesListViewModeInput {}

class RepositoriesViewModel: RepositoriesViewModelType {
    
    // MARK: - Data
    var items = BehaviorRelay<[RepositoryModel]>(value: [])
    var loadingType = BehaviorRelay<RepositoriesListLoadingType>(value: .none)
    var error = BehaviorRelay<Error?>(value: nil)
    
    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let searchRepositoriesUseCase: SearchRepositoriesUseCaseType
    
    init(searchRepositoriesUseCase: SearchRepositoriesUseCaseType) {
        self.searchRepositoriesUseCase = searchRepositoriesUseCase
    }
    
    // MARK: - Input
    func search(query: String) {
        let query = RepositoryQuery(searchValue: query)
        searchRepositoriesUseCase.searchGitHubRepositories(request: query) { [weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let model): self.items.accept(self.items.value + model)
            case .failure(let error): self.error.accept(error)
            }
        }
    }
    
    func cancelSearch() {
        self.items.accept([])
    }
}



