//
//  Bath.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 23/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

class Bath: NSObject {
    
    private var coldWaterLitres: Float = 0
    private var hotWaterLitres: Float = 0
    
    internal func waterLevel() -> Float {
        return hotWaterLitres + coldWaterLitres
    }
    
    func fillColdWater(level: Float) {
        coldWaterLitres += level
    }
    
    func fillHotWater(level: Float) {
        hotWaterLitres += level
    }
    
    func coldWaterLevel() -> Float {
        return coldWaterLitres
    }
    
    func hotWaterLevel() -> Float {
        return hotWaterLitres
    }
}
