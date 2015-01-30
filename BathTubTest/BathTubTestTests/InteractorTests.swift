//
//  InteractorTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 23/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

import BathTubTest

class MockBath: Bath {
    var waterLevelCalled = false
    
    override func waterLevel() -> Float {
        waterLevelCalled = true
        return 15.2
    }

    var fillColdWaterCalled = false
    var coldWaterAmountFilled: Float = 0
    var fillColdWaterMessageCount = 0

    override func fillColdWater(level: Float) {
        fillColdWaterCalled = true
        coldWaterAmountFilled = level
        fillColdWaterMessageCount++
        super.fillColdWater(level)
    }
    
    var fillHotWaterCalled = false
    var hotWaterAmountFilled: Float = 0
    var fillHotWaterMessageCount = 0
    
    override func fillHotWater(level: Float) {
        fillHotWaterCalled = true
        hotWaterAmountFilled = level
        fillHotWaterMessageCount++
        super.fillHotWater(level)
    }
}

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

class InteractorTests: XCTestCase {

    let interactor = Interactor()
    let mockBath = MockBath()
    let mockDelegate = MockDelegate()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor.bath = mockBath
        interactor.delegate = mockDelegate
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockBath.fillColdWaterMessageCount = 0
        super.tearDown()
    }
    
    func testInteractorGetsWaterLevelFromBath() {
        interactor.fetchWaterLevel()
        XCTAssertTrue(mockBath.waterLevelCalled)
    }
    
    func testInteractorSendsWaterLevelToPresenter() {
        interactor.fetchWaterLevel()
        XCTAssertTrue(mockDelegate.updateWaterLevelCalled)
    }
    
    func testInteractorSendsCorrectWaterLevel() {
        interactor.sendWaterLevel()
        XCTAssertEqualWithAccuracy(mockDelegate.waterLevelBeingPassed, Float(15.2), 0)
    }
    
    // MARK: Cold Tap
    
    func testInteractorFillsBathWithWaterWhenColdTapIsOn() {
        interactor.toggleColdTap()
        waitInRunLoopWithDelay(1)
        XCTAssertTrue(mockBath.fillColdWaterCalled)
    }
    
    func testInteractorSendsWaterLevelWhenItFillsColdWater() {
        interactor.toggleColdTap()
        waitInRunLoopWithDelay(1)
        XCTAssertTrue(mockDelegate.updateWaterLevelCalled)
    }
    
    func testInteractorFillsColdWaterWithCorrectAmountPerSecond() {
        interactor.toggleColdTap()
        waitInRunLoopWithDelay(1)
        XCTAssertEqualWithAccuracy(mockBath.coldWaterAmountFilled, Float(0.2), 0)
    }
    
    func testInteractorFillBathWithColdWaterEverySecond() {
        interactor.toggleColdTap()
        waitInRunLoopWithDelay(3)
        XCTAssertEqual(mockBath.fillColdWaterMessageCount, 3)
    }
    
    func testInteractorStopsFlowForClosingColdWaterTap() {
        interactor.toggleColdTap()
        waitInRunLoopWithDelay(1)
        interactor.toggleColdTap()
        waitInRunLoopWithDelay(1)
        XCTAssertEqual(mockBath.fillColdWaterMessageCount, 1)
    }
    
    //MARK: Hot Tap
    
    func testInteractorFillsBathWithWaterWhenHotTapIsOn() {
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(1)
        XCTAssertTrue(mockBath.fillHotWaterCalled)
    }
    
    func testInteractorSendsWaterLevelWhenItFillsHotWater() {
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(1)
        XCTAssertTrue(mockDelegate.updateWaterLevelCalled)
    }
    
    func testInteractorFillsHotWaterWithCorrectAmountPerSecond() {
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(1)
        XCTAssertEqualWithAccuracy(mockBath.hotWaterAmountFilled, Float(0.16), 0.01)
    }
    
    func testInteractorFillsBathWithHotWaterEverySecond() {
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(3)
        XCTAssertEqual(mockBath.fillHotWaterMessageCount, 3)
    }
    
    func testInteractorStopsFlowForClosingHotWaterTap() {
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(1)
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(1)
        XCTAssertEqual(mockBath.fillHotWaterMessageCount, 1)
    }
    
    //MARK: Both Taps Coverage
    
    func testInteractorManagesBothTapsOpen() {
        interactor.toggleColdTap()
        interactor.toggleHotTap()
        waitInRunLoopWithDelay(2)
        XCTAssertEqual(mockBath.fillColdWaterMessageCount, 2)
        XCTAssertEqual(mockBath.fillHotWaterMessageCount, 2)
    }
    
    //MARK: Temperature
    
    func testInteractorSendsTemperatureWhenPrompted() {
        interactor.sendTemperature()
        XCTAssertTrue(mockDelegate.updateTemperatureCalled)
    }
    
    func testInteractorPassesTemperatureFromThermometer() {
        mockBath.fillColdWater(20)
        mockBath.fillHotWater(20)
        let coldWater = Water(amount: 20, temperature: 10)
        let hotWater = Water(amount: 20, temperature: 50)
        let temp = Thermometer.waterTemperature(coldWater: coldWater, hotWater: hotWater)
        interactor.sendTemperature()
        XCTAssertEqualWithAccuracy(mockDelegate.temperatureValue, temp, 0.1)
    }
    
    func testUpdatesTemperatureAsColdWaterFills() {
        interactor.fillColdWater()
        XCTAssertTrue(mockDelegate.updateTemperatureCalled)
    }
    
    func testUpdatesTemperatureAsHotWaterFills() {
        interactor.fillHotWater()
        XCTAssertTrue(mockDelegate.updateTemperatureCalled)
    }
    
    //MARK: Convenience 
    
    func waitInRunLoopWithDelay(delay: NSTimeInterval) {
        let waitTilDate = NSDate(timeIntervalSinceNow: delay)
        NSRunLoop.currentRunLoop().runUntilDate(waitTilDate)
    }
    
}
