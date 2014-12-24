//
//  BathTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 23/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

class BathTests: XCTestCase {

    var bath = Bath()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWaterLevelReturnTheFillLevelOfTheBath() {
        bath.litresFull = 50
        let level = bath.waterLevel()
        XCTAssertEqualWithAccuracy(level, bath.litresFull, 0)
    }
    
    func testFillColdWaterUpdatesLitresFullVarCorrectly() {
        bath.fillColdWater(150)
        let amount = 150
        XCTAssertEqualWithAccuracy(bath.waterLevel(), Float(150), 0)
    }
    
    func testFillColdWaterAddsWaterCorrectly() {
        for var i = 0; i < 3; i++ {
            bath.fillColdWater(1)
        }
        XCTAssertEqualWithAccuracy(bath.waterLevel(), Float(3), 0)
    }
    
    func testFillHotWaterAddsWaterCorrectly() {
        for var i = 0; i < 3; i++ {
            bath.fillHotWater(1)
        }
        XCTAssertEqualWithAccuracy(bath.waterLevel(), Float(3), 0)
    }
    
}
