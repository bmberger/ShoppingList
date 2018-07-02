//
//  XcodeProject2_Table_3_0Tests.swift
//  XcodeProject2_Table_3.0Tests
//
//  Created by Briana Berger on 6/29/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import XCTest
@testable import XcodeProject2_Table_3_0

class UnitTest: XCTestCase {
    
    func testAddEmpty()
    {
        let input = ""
        let expectedProduct = ["Bread", "Milk"]
        let product = Unit().addTask(name : input)
        XCTAssertEqual(expectedProduct, product)
    }
    
    func testAddOneSpace()
    {
        let input = " "
        let expectedProduct = ["Bread", "Milk", " "]
        let product = Unit().addTask(name : input)
        XCTAssertEqual(expectedProduct, product)
    }
    
    func testLongestWord()
    {
        //fun fact: it is a lung disease... very unfortunate and weird to have on a shopping list haha
        let input = "Pneumonoultramicroscopicsilicovolcanoconiosis"
        let expectedProduct = ["Bread", "Milk", "Pneumonoultramicroscopicsilicovolcanoconiosis"]
        let product = Unit().addTask(name : input)
        XCTAssertEqual(expectedProduct, product)
    }
    
}
