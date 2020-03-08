// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct Repository: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let name: String?
    let htmlUrl: String?
    let language: String?
    let stars: Int?
    let owner: Owner?
    
    enum CodingKeys: String, CodingKey {
        case name
        case language
        case htmlUrl = "html_url"
        case stars = "stargazers_count"
        case owner
    }
}

struct Owner: Codable {
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
