//
//  PresenterTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 23/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

class PresenterTests: XCTestCase {

    let presenter = Presenter()
    let mockView = MockView()
    let mockInteractor = MockInteractor()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter.view = mockView
        presenter.interactor = mockInteractor
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        presenter.view = nil
        presenter.interactor = nil
    }

    func testPresenterCallsViewUpdateForWaterLevel() {
        presenter.updateWaterLevel(0)
        XCTAssertTrue(mockView.updateWaterLevelCalled)
    }
    
    func testPresenterPassCorrectStringForWaterLevel() {
        presenter.updateWaterLevel(102.70)
        XCTAssertEqual(mockView.levelString, "102.70")
    }
    
    func testPresenterAsksInteractorToFetchWaterLevelOnViewDidLoad() {
        presenter.interactor = mockInteractor
        presenter.viewDidLoad()
        XCTAssertTrue(mockInteractor.fetchWaterLevelCalled)
    }
    
    func testPresenterTellsInteractorToOpenColdTap() {
        presenter.interactor = mockInteractor
        presenter.coldWaterTapDidReceiveTap()
        XCTAssertTrue(mockInteractor.openColdTapCalled)
    }
    
    func testPresenterTellsInteractorTopToggleHotTap() {
        presenter.interactor = mockInteractor
        presenter.hotWaterTapDidReceiveTap()
        XCTAssertTrue(mockInteractor.openHotTapCalled)
    }
    
    func testUpdatesWaterLevelOnlyTwoDecimalDigits() {
        presenter.updateWaterLevel(100.12345)
        XCTAssertEqual(mockView.levelString, "100.12")
    }
    
    func testUpdatesTemperature() {
        presenter.updateTemperature(30)
        XCTAssertTrue(mockView.updateTemperatureStringCalled)
    }
    
    func testUpdatesTemperatureWithCorrectValue() {
        presenter.updateTemperature(20.20)
        XCTAssertEqual(mockView.temperatureString, "20.20")
    }
    
    func testCallsForInitialTempOnViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(mockInteractor.sendTempLevelCalled)
    }
    
    func testLimitsTempTwoFloatDigits() {
        presenter.updateTemperature(102.353)
        XCTAssertEqual(mockView.temperatureString, "102.35")
    }
}
