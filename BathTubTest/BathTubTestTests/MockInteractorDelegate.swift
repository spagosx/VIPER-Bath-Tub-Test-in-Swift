//
//  MockInteractorDelegate.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 30/01/15.
//  Copyright (c) 2015 spagosx. All rights reserved.
//

import Foundation

class MockDelegate: InteractorDelegate {
    
    var updateWaterLevelCalled = false
    var waterLevelBeingPassed = Float(-1)
    func updateWaterLevel(level: Float) {
        updateWaterLevelCalled = true
        waterLevelBeingPassed = level
    }
    
    var updateTemperatureCalled = false
    var temperatureValue: Float = 0
    func updateTemperature(temperature: Float) {
        updateTemperatureCalled = true
        temperatureValue = temperature
    }
    
}
