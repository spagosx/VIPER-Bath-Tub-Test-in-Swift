//
//  Presenter.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import Foundation

class Presenter: NSObject {
    weak var view: View!
    var interactor: Interactor!
    
    func viewDidLoad() {
        interactor.fetchWaterLevel()
    }
    
    func coldWaterTapDidReceiveTap() {
        interactor.toggleColdTap()
    }
    
    func hotWaterTapDidReceiveTap() {
        interactor.toggleHotTap()
    }

}

extension Presenter: InteractorDelegate {
    
    func updateWaterLevel(level: Float) {
        let formattedLevel = String(format: "%.2f", level)
        view.updateWaterLevel("\(formattedLevel)")
    }
    
    func updateTemperature(temperature: Float) {
        view.updateTemperature("\(temperature)")
    }
}