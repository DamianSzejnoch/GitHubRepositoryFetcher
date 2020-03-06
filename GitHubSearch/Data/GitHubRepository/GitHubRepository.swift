//
//  GitHubRepository.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class GitHubRepository: GitHubRepositoryType {
    
    var responseCallBack = BehaviorRelay<Repository?>(value: nil)
    
    //MARK: Private
    private let disposeBag = DisposeBag()
    private let networking: HTTPNetworking
    
    init(networking: HTTPNetworking) {
        self.networking = networking
    }
    
    // Methods
    func fetchRepos(query: RepositoryQuery) {
        let query = Query(endPoint: GitHubRepositoryAPI.repos, queryParameters: ["q": query.searchValue])
        
        networking.request(query: query)
        networking.response.asObservable().subscribe(onNext: { [weak self] repository in
            guard let self = self else { return }
            guard let data = repository as? Data else { return }
            let decodedRepository = JsonResponseDecoder.decodeJSON(type: Repository.self, from: data)
            self.responseCallBack.accept(decodedRepository)
            }).disposed(by: disposeBag)
    }
}
