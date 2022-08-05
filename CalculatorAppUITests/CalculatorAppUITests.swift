//
//  ex02UITests.swift
//  ex02UITests
//
//  Created by shimada shun on 2022/08/04.
//

import XCTest

class CalculatorAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTContext.runActivity(named: "足し算 3 + 5") { (activity) in
            app.buttons["3"].tap()
            app.buttons["+"].tap()
            app.buttons["5"].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "8")
            app.buttons["="].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "18")
            app.buttons["AC"].tap()
        }
        
        XCTContext.runActivity(named: "引き算 5 - 3") { (activity) in
            app.buttons["5"].tap()
            app.buttons["-"].tap()
            app.buttons["3"].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "2")
            app.buttons["="].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "-4")
            app.buttons["AC"].tap()
        }
        
        XCTContext.runActivity(named: "掛け算 5 * 3") { (activity) in
            app.buttons["5"].tap()
            app.buttons["*"].tap()
            app.buttons["3"].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "15")
            app.buttons["="].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "135")
            app.buttons["AC"].tap()
        }
        
        XCTContext.runActivity(named: "割り算 9 / 3") { (activity) in
            app.buttons["9"].tap()
            app.buttons["/"].tap()
            app.buttons["3"].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "3")
            app.buttons["="].tap()
            app.buttons["="].tap()
            XCTAssertEqual(app.staticTexts["ViewController_label_result"].label, "0")
            app.buttons["AC"].tap()
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
