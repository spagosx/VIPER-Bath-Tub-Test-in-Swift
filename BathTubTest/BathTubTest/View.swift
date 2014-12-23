//
//  View.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import Foundation

protocol View: class {
    var presenter: Presenter! {get set}
    func updateWaterLevel(level: String)
}