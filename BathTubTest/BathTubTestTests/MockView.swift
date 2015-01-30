//
//  MockView.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 30/01/15.
//  Copyright (c) 2015 spagosx. All rights reserved.
//

import UIKit

class MockView: View {
    
    var presenter: Presenter! = nil
    var updateWaterLevelCalled = false
    var levelString: String! = nil
    func updateWaterLevel(level: String) {
        updateWaterLevelCalled = true
        levelString = level
    }
    var updateTemperatureStringCalled = false
    var temperatureString: String! = nil
    func updateTemperature(temperature: String) {
        updateTemperatureStringCalled = true
        temperatureString = temperature
    }
    
}
