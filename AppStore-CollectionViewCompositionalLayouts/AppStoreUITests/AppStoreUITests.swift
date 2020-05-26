//
//  AppStoreUITests.swift
//  AppStoreUITests
//
//  Created by Damien Murphy on 5/26/20.
//  Copyright © 2020 Kishikawa Katsumi. All rights reserved.
//

import XCTest

class AppStoreUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTabBarMenuItems() {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.staticTexts["Today"].exists)
        app.tabBars.buttons["Games"].tap()
        XCTAssert(app.staticTexts["Games"].exists)
        app.tabBars.buttons["Apps"].tap()
        XCTAssert(app.staticTexts["Apps"].exists)
        app.tabBars.buttons["Updates"].tap()
        XCTAssert(app.staticTexts["Updates"].exists)
        app.tabBars.buttons["Search"].tap()
        XCTAssert(app.staticTexts["Search"].exists)
    }
    

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
