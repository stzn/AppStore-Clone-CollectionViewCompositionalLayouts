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
    
    func takeScreenshot(app: XCUIApplication) {
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
        
        let imageData = screenshot.image.pngData()
        if let path = failureImageDirectoryPath?
            .appendingPathComponent("/")
            .appendingPathComponent("\(self)_") {
                try? imageData?.write(to: path)
            }
    }
    
    private var failureImageDirectoryPath: URL? {
        let fileManager = FileManager.default

        let path = URL(fileURLWithPath: "")
        if !fileManager.fileExists(atPath: path.absoluteString) {
            try? fileManager.createDirectory(
                at: path,
                withIntermediateDirectories: true,
                attributes: nil
            )
        }
        return path
    }
    
    func testTabBarMenuItemsToday() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Today"].tap()
        XCTAssert(app.staticTexts["Today"].exists)
        takeScreenshot(app: app)
    }
    
    func testTabBarMenuItemsGames() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Games"].tap()
        XCTAssert(app.staticTexts["Games"].exists)
        takeScreenshot(app: app)
    }
    
    func testTabBarMenuItemsApps() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Apps"].tap()
        XCTAssert(app.staticTexts["Apps"].exists)
        takeScreenshot(app: app)
    }
    
    func testTabBarMenuItemsUpdates() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Updates"].tap()
        XCTAssert(app.staticTexts["Updates"].exists)
        takeScreenshot(app: app)
    }
    
    func testTabBarMenuItemsSearch() {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Search"].tap()
        XCTAssert(app.staticTexts["Search"].exists)
        takeScreenshot(app: app)
    }
}
