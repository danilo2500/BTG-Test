//
//  Teste_iOS_BTGTests.swift
//  Teste-iOS-BTGTests
//
//  Created by BTG Pactual digital on 30/11/18.
//  Copyright © 2018 BTG Pactual. All rights reserved.
//

import XCTest
@testable import Teste_iOS_BTG

class Teste_iOS_BTGTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPercentageFormatter() {
        let value = Double(20.19301)
        
        let valueFormatted = FormatterUtils.formatPercentage(value: value)
        
        XCTAssertEqual(valueFormatted, "20,19%")
    }

    func testDateFormatter() {
       
        let value = "2019-01-31T00:00:00.000-0200"
        
        let valueFormatted = FormatterUtils.formatDate(dateString: value)
        
        XCTAssertEqual(valueFormatted, "31/01/2019")
    }
}
