//
//  HTTPNetworking.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

protocol Networking {
    var response: BehaviorRelay<Any?> { get set }
    func request(query: Query)
}

class HTTPNetworking: Networking {
    var response = BehaviorRelay<Any?>(value: nil)
    
    func request(query: Query) {
        AF.request(query.endPoint.path, parameters: query.queryParameters).response { [weak self] response in
          guard let self = self else { return }
            switch response.result {
            case .success:
                self.response.accept(response.data)
            case .failure:
                self.response.accept(response.error)
            }
        }
    }
}

struct Query {
    let endPoint: Endpoint
    let queryParameters: [String: String]
}


