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
    typealias Completion = (Data?, Swift.Error?) -> Void
    func request(query: Query, completion: @escaping Completion)
}

class HTTPNetworking: Networking {
    func request(query: Query, completion: @escaping Completion) {
        AF.request(query.endPoint.path, parameters: query.queryParameters).response { [weak self] response in
            guard let self = self else { return }
            completion(response.data, response.error)
        }
    }
}

struct Query {
    let endPoint: Endpoint
    let queryParameters: [String: String]
}


