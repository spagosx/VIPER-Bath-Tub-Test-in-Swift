//
//  MockBath.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 30/01/15.
//  Copyright (c) 2015 spagosx. All rights reserved.
//

import Foundation

class MockBath: Bath {
    
    var waterLevelCalled = false
    
    override func waterLevel() -> Float {
        waterLevelCalled = true
        return 15.2
    }
    
    var fillColdWaterCalled = false
    var coldWaterAmountFilled: Float = 0
    var fillColdWaterMessageCount = 0
    
    override func fillColdWater(level: Float) {
        fillColdWaterCalled = true
        coldWaterAmountFilled = level
        fillColdWaterMessageCount++
        super.fillColdWater(level)
    }
    
    var fillHotWaterCalled = false
    var hotWaterAmountFilled: Float = 0
    var fillHotWaterMessageCount = 0
    
    override func fillHotWater(level: Float) {
        fillHotWaterCalled = true
        hotWaterAmountFilled = level
        fillHotWaterMessageCount++
        super.fillHotWater(level)
    }
    
}
