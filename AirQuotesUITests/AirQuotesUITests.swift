//
//  AirQuotesUITests.swift
//  AirQuotesUITests
//
//  Created by riccardo ruocco on 11/04/22.
//

import XCTest
import SwiftUI

class AirQuotesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBigNumberOfQuote() throws{
        let app = XCUIApplication()
        app.launch()
        sleep(1)
                
        for numeroTest in 0..<1000{
            var addButton = app.buttons["addButton"]
            addButton.tap()
            var quoteField = app.textViews["quoteField"]
            quoteField.tap()
            quoteField.typeText("TestoDiProva123$#ù")
            
            var newCollectionButton = app.buttons["newCollection"]
            newCollectionButton.tap()
            
            var collectionNameField = app.textFields["collectionName"]
            collectionNameField.tap()
            collectionNameField.typeText("TestoDiProva123$#ù-\(numeroTest)\n")
            
            var collectionDoneButton = app.buttons["collectionDoneButton3"]
            collectionDoneButton.tap()
            var quoteDoneButton = app.buttons["quoteDoneButton"]
            quoteDoneButton.tap()
        }
        
        
        
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
