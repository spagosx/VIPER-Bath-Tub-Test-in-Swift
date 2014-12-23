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
        return 0
    }
}

class MockDelegate: InteractorDelegate {
    var updateWaterLevelCalled = false
    func updateWaterLevel(level: Float) {
        updateWaterLevelCalled = true
    }
}

class InteractorTests: XCTestCase {

    var interactor: Interactor!
    var bath: Bath!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bath = Bath()
        interactor = Interactor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInteractorGetsWaterLevelFromBath() {
        let mockBath = MockBath()
        interactor.bath = mockBath
        interactor.fetchWaterLevel()
        XCTAssertTrue(mockBath.waterLevelCalled)
    }
    
    func testInteractorSendsWaterLevelToPresenter() {
        let delegate = MockDelegate()
        interactor.delegate = delegate
        interactor.fetchWaterLevel()
        XCTAssertTrue(delegate.updateWaterLevelCalled)
    }
}
