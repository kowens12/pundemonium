//
//  emojisUITests.swift
//  emojisUITests
//
//  Created by Katherine Owens on 11/11/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import XCTest

class emojisUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["😸  cat"].tap()
        
        let punWordsNavigationBar = app.navigationBars["Pun Words"]
        punWordsNavigationBar.buttons["Add"].tap()
        
        let textView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.typeText("this, test")
        
        app.buttons["Add Topics"].tap()
        app.navigationBars["emojis.AddTopicsView"].buttons["Done"].tap()
        tablesQuery.staticTexts["Test"].tap()
        app.sliders["0%"].tap()
        
        let textView2 = app.otherElements.containing(.navigationBar, identifier:"emojis.PunWordInfoView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView2.tap()
        textView2.typeText("testing ui ")
        app.buttons["Save Info"].tap()
        app.navigationBars["emojis.PunWordInfoView"].buttons["Pun Words"].tap()
        punWordsNavigationBar.buttons["Categories"].tap()
        
    }
    
}
