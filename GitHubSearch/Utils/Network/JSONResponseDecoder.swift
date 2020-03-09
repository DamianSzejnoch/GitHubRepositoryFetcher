//
//  JSONResponseDecoder.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 06/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation

public class JsonResponseDecoder {
    static func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from,
        let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
