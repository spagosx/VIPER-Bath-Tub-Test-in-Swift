//
//  MockInteractor.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 30/01/15.
//  Copyright (c) 2015 spagosx. All rights reserved.
//

import UIKit

class MockInteractor: Interactor {
    
    var fetchWaterLevelCalled = false
    var openColdTapCalled = false
    var openHotTapCalled = false
    var sendTempLevelCalled = false
    
    override func fetchWaterLevel() {
        fetchWaterLevelCalled = true
    }
    override func toggleColdTap() {
        openColdTapCalled = true
    }
    override func toggleHotTap() {
        openHotTapCalled = true
    }
    
    override func sendTemperature() {
        sendTempLevelCalled = true
    }
    
}
