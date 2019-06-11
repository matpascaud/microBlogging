//
//  MicroBloggingAppUITests.swift
//  MicroBloggingAppUITests
//
//  Created by Matthieu PASCAUD on 5/22/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import XCTest

class MicroBloggingAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTouchTableViewAuthors() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tablesQuery = XCUIApplication().tables
        let authorTap = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Kailee Nolan"]/*[[".cells[\"Kailee Nolan, jordyn.gerlach33@hotmail.com\"].staticTexts[\"Kailee Nolan\"]",".staticTexts[\"Kailee Nolan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let authorDetail = app.staticTexts["Eileen_Batz"]
        
        if authorTap.isSelected {
            XCTAssertTrue(authorDetail.exists)
            
        }
        
    }

}
