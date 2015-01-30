//
//  Thermometer.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 28/01/15.
//  Copyright (c) 2015 spagosx. All rights reserved.
//

import UIKit
import XCTest

class ThermometerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThermometerCalculateCorrectTemperatureForEvenLevel() {
        let coldWater = Water(amount:30, temperature:10)
        let hotWater = Water(amount:30, temperature:12)
        let temp = Thermometer.waterTemperature(coldWater: coldWater, hotWater: hotWater)
        XCTAssertEqualWithAccuracy(temp, Float(11), 0.0)
    }
    
    func testThermometerCalculateCorrectTemperatureForOddLevel() {
        let coldWater = Water(amount:35, temperature:10)
        let hotWater = Water(amount:40, temperature:12)
        let temp = Thermometer.waterTemperature(coldWater: coldWater, hotWater: hotWater)
        XCTAssertEqualWithAccuracy(temp, Float(11.07), 0.01)
    }
    
    func testReturnsZeroIfWaterLevelIsZero() {
        let coldWater = Water(amount:0, temperature:10)
        let hotWater = Water(amount: 0, temperature: 50)
        let temp = Thermometer.waterTemperature(coldWater: coldWater, hotWater: hotWater)
        XCTAssertEqualWithAccuracy(temp, Float(0), 0, "Should not return nan")
    }

}
