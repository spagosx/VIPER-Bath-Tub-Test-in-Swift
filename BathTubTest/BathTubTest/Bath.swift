//
//  Bath.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 23/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

class Bath: NSObject {
    
    var litresFull: Float = 0
    
    internal func waterLevel() -> Float {
        return litresFull
    }
    
    func fillColdWater() {
        litresFull = 150
    }
}
