//
//  GitHubSearchScreenshot.swift
//  GitHubSearchScreenshot
//
//  Created by Damian Szejnoch on 15/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import XCTest

class GitHubSearchScreenshot: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        let app = XCUIApplication()
        
        setupSnapshot(app)
        app.launch()
    }
    func testScreenshots() {
        let app = XCUIApplication()
        
        
        let searchText = "RxSwift"
        app.searchFields[AccessibilityIdentifier.searchField].tap()
//        if !app.keys["A"].waitForExistence(timeout: 5) {
//            XCTFail("The keyboard could not be found. Use keyboard shortcut COMMAND + SHIFT + K while simulator has focus on text input")
//        }
        
        app.searchFields[AccessibilityIdentifier.searchField].typeText(searchText)
        app.buttons["Search"].tap()
        sleep(3)
        snapshot("01List")
    }
}
