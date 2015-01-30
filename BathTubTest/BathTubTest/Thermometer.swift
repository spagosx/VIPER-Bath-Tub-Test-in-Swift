//
//  Thermometer.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 28/01/15.
//  Copyright (c) 2015 spagosx. All rights reserved.
//

import UIKit

struct Water {
    var amount: Float
    var temperature: Float
}

let waterHeatSpecific: Float = 4182

class Thermometer: NSObject {
    
    private var coldWater: Water!
    private var hotWater: Water!
   
//    init(coldWater: Water, hotWater: Water) {
//        self.coldWater = coldWater
//        self.hotWater = hotWater
//    }
    
    class var sharedInstance: Thermometer {
        struct Static {
            static var instance: Thermometer?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Thermometer()
        }
        
        return Static.instance!
    }
    
    class func waterTemperature(#coldWater: Water, hotWater: Water) -> Float {
        
        if coldWater.amount == 0 && hotWater.amount == 0 {
            return 0
        }
        
        let thermometer = Thermometer.sharedInstance
        thermometer.coldWater = coldWater
        thermometer.hotWater = hotWater
        
        let temperature = thermometer.avarageTemperature() / thermometer.avarageLevel()
        return temperature
    }
    
    func avarageTemperature() -> Float {
        return specificTemperature(coldWater) + specificTemperature(hotWater)
    }
    
    func specificTemperature(water: Water) -> Float {
        let level = water.amount
        let temp = water.temperature
        return level * waterHeatSpecific * temp
    }
    
    func avarageLevel() -> Float {
        return specificLevel(coldWater) + specificLevel(hotWater)
    }
    
    func specificLevel(water: Water) -> Float {
        return water.amount * waterHeatSpecific
    }
    
}
