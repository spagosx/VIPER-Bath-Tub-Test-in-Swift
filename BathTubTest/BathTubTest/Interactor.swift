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
}

class Interactor: NSObject {
    
    weak var delegate: InteractorDelegate? = nil
    var bath: Bath?
    
    let coldWaterFillRate: Float = 12
    
    var coldWaterTimer: NSTimer?
    
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
    }
    
    func coldWaterRatePerSecond() -> Float {
        return Float(coldWaterFillRate / Float(60))
    }
    
    func sendWaterLevel() {
        let waterLevel = bath?.waterLevel()
        delegate?.updateWaterLevel(waterLevel!)
    }
    
    
}
