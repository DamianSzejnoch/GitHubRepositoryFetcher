//
//  CellError.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 06/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation

import UIKit

class CellError {
    
    private init() {}
    
    static let shared = CellError()
    
    func showError(cellTitle: Any, cellID: String) -> String {
        return ("Expected \(cellTitle) type for reuseIdentifier \(cellID). Check the configuration")
    }
}
