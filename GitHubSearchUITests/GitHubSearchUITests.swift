//
//  GitHubSearchUITests.swift
//  GitHubSearchUITests
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//


import XCTest

class GitHubSearchUITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
        continueAfterFailure = false
    }
    
    
    // NOTE: for UI tests to work the keyboard of simulator must be on.
    // Keyboard shortcut COMMAND + SHIFT + K while simulator has focus
    func testSearchListWhenSearchRxSwiftRepositories() {
        let app = XCUIApplication()
        let searchText = "RxSwift"
        app.searchFields[AccessibilityIdentifier.searchField].tap()
        if !app.keys["A"].waitForExistence(timeout: 5) {
            XCTFail("The keyboard could not be found. Use keyboard shortcut COMMAND + SHIFT + K while simulator has focus on text input")
        }
        
        app.searchFields[AccessibilityIdentifier.searchField].typeText(searchText)
        app.buttons["search"].tap()
        sleep(3)
    }
}
