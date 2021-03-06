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
    
    func testFillColdWaterReturnsCorrectCombinedLevel() {
        bath.fillColdWater(70)
        bath.fillHotWater(50)
        XCTAssertEqualWithAccuracy(bath.waterLevel(), Float(120), accuracy: 0)
    }
    
    func testFillColdWaterAddsWaterCorrectly() {
        for var i = 0; i < 3; i++ {
            bath.fillColdWater(1)
        }
        XCTAssertEqualWithAccuracy(bath.coldWaterLevel(), Float(3), accuracy: 0)
    }
    
    func testFillHotWaterAddsWaterCorrectly() {
        for var i = 0; i < 3; i++ {
            bath.fillHotWater(1)
        }
        XCTAssertEqualWithAccuracy(bath.hotWaterLevel(), Float(3), accuracy: 0)
    }
    
}
