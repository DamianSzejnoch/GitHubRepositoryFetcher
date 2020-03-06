//
//  GitHubRepositoryType.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import RxSwift
import RxCocoa

protocol GitHubRepositoryType {
    var responseCallBack: BehaviorRelay<Repository?> { get }
    func fetchRepos(query: RepositoryQuery)
}
