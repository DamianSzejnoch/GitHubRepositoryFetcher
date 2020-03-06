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

protocol RepositoriesListViewModeInput {
    func search(query: String)
    func cancelSearch()
}
protocol RepositoriesListViewModelOutput {
    func onViewDidLoad()
    var items: BehaviorRelay<[RepositoryModel]> { get }
}

protocol RepositoriesViewModelType:  RepositoriesListViewModelOutput, RepositoriesListViewModeInput {}

class RepositoriesViewModel: RepositoriesViewModelType {
    
    // MARK: - Data
    var items = BehaviorRelay<[RepositoryModel]>(value: [])
    
    // MARK: - Private
    private let disposeBag = DisposeBag()
    private let searchRepositoriesUseCase: SearchRepositoriesUseCaseType
    
    
    
    init(searchRepositoriesUseCase: SearchRepositoriesUseCaseType) {
        self.searchRepositoriesUseCase = searchRepositoriesUseCase
    }
    
    // MARK: - Input
    func search(query: String) {
        let query = RepositoryQuery(searchValue: query)
        searchRepositoriesUseCase.searchGitHubRepositories(request: query)
        
    }
    // MARK: - Output
    func onViewDidLoad() {
        searchRepositoriesUseCase.response.asObservable().subscribe(onNext: { [weak self] repositories in
            guard let self = self else { return }
            self.items.accept(repositories)
        }).disposed(by: disposeBag)
    }
    
    func cancelSearch() {
        self.items.accept([])
    }
}



