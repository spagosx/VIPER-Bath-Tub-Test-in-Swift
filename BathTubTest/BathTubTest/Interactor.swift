//
//  Interactor.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

protocol InteractorDelegate : class {
    func updateWaterLevel(level: Float)
    func updateTemperature(temperature: Float)
}

class Interactor: NSObject {
    
    weak var delegate: InteractorDelegate? = nil
    var bath: Bath?
    
    let coldWaterFillRate: Float = 12
    let hotWaterFillRate: Float = 10
    
    var coldWaterTimer: NSTimer?
    var hotWaterTimer: NSTimer?
    
    func fetchWaterLevel() {
        sendWaterLevel()
    }
    
    func toggleColdTap() {
        if coldWaterTimer == nil {
            openColdTap()
        } else {
            closeColdTap()
        }
    }
    
    func openColdTap() {
        coldWaterTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("fillColdWater"), userInfo: nil, repeats: true)
    }
    
    func closeColdTap() {
        coldWaterTimer?.invalidate()
        coldWaterTimer = nil
    }
    
    func fillColdWater() {
        bath?.fillColdWater(coldWaterRatePerSecond())
        sendWaterLevel()
        sendTemperature()
    }
    
    func toggleHotTap() {
        if hotWaterTimer == nil {
            openHotTap()
        } else {
            closeHotTap()
        }
    }
    
    func openHotTap() {
        hotWaterTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("fillHotWater"), userInfo: nil, repeats: true)
    }
    
    func closeHotTap() {
        hotWaterTimer?.invalidate()
        hotWaterTimer = nil
    }
    
    func fillHotWater() {
        bath?.fillHotWater(hotWaterRatePerSecond())
        sendWaterLevel()
        sendTemperature()
    }
    
    func coldWaterRatePerSecond() -> Float {
        return Float(coldWaterFillRate / Float(60))
    }
    
    func hotWaterRatePerSecond() -> Float {
        return Float(hotWaterFillRate / Float(60))
    }
    
    func sendWaterLevel() {
        let waterLevel = bath?.waterLevel()
        delegate?.updateWaterLevel(waterLevel!)
    }
    
    // MARK: Temperature
    
    func sendTemperature() {
        let temp = fetchTemperature()
        delegate?.updateTemperature(temp)
    }
    
    func fetchTemperature() -> Float {
        let coldWater = Water(amount:bath!.coldWaterLevel(), temperature: 10)
        let hotWater = Water(amount: bath!.hotWaterLevel(), temperature: 50)
        let temperature = Thermometer.waterTemperature(coldWater: coldWater, hotWater: hotWater)
        return temperature
    }
    
}
