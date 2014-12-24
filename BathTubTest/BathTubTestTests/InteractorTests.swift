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
    var fillColdWaterCalled = false
    var coldWaterAmountFilled: Float = 0
    var fillColdWaterMessageCount = 0
    override func waterLevel() -> Float {
        waterLevelCalled = true
        return 15.2
    }
    override func fillColdWater(level: Float) {
        fillColdWaterCalled = true
        coldWaterAmountFilled = level
        fillColdWaterMessageCount++
    }
}

class MockDelegate: InteractorDelegate {
    var updateWaterLevelCalled = false
    var waterLevelBeingPassed = Float(-1)
    func updateWaterLevel(level: Float) {
        updateWaterLevelCalled = true
        waterLevelBeingPassed = level
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
    
    func testInteractorFillsBathWithWaterWhenTapIsOn() {
        interactor.openColdTap()
        let waitTime = NSDate(timeIntervalSinceNow: 1)
        NSRunLoop.currentRunLoop().runUntilDate(waitTime)
        XCTAssertTrue(mockBath.fillColdWaterCalled)
    }
    
    func testInteractorSendsWaterLevelWhenItFillsColdWater() {
        interactor.openColdTap()
        let waitTime = NSDate(timeIntervalSinceNow: 1)
        NSRunLoop.currentRunLoop().runUntilDate(waitTime)
        XCTAssertTrue(mockDelegate.updateWaterLevelCalled)
    }
    
    func testInteractorSendsCorrectWaterLevel() {
        interactor.sendWaterLevel()
        XCTAssertEqualWithAccuracy(mockDelegate.waterLevelBeingPassed, Float(15.2), 0)
    }
    
    func testInteractorFillsColdWaterWithCorrectAmountPerSecond() {
        interactor.openColdTap()
        let waitTime = NSDate(timeIntervalSinceNow: 1)
        NSRunLoop.currentRunLoop().runUntilDate(waitTime)
        XCTAssertEqualWithAccuracy(mockBath.coldWaterAmountFilled, Float(0.2), 0)
    }
    
    func testInteractorFillBathEverySecond() {
        interactor.openColdTap()
        let waitTime = NSDate(timeIntervalSinceNow: 3)
        NSRunLoop.currentRunLoop().runUntilDate(waitTime)
        XCTAssertEqual(mockBath.fillColdWaterMessageCount, 3)
    }
}
