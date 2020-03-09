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
}

// MARK: - Item
struct Item: Codable {
    let name: String?
    let htmlUrl: String?
    let language: String?
    let stargazersCount: Int?
    let owner: Owner?
}

struct Owner: Codable {
    let avatarUrl: String?
}
