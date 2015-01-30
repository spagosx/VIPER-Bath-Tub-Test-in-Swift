//
//  ViewControllerTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

class MockPresenter: Presenter {
    var viewDidLoadCalled = false
    var coldWaterTapDidReceiveTapCalled = false
    var hotWaterTapDidReceiveTapCalled = false
    
    override func viewDidLoad() {
        viewDidLoadCalled = true
    }
    override func coldWaterTapDidReceiveTap() {
        coldWaterTapDidReceiveTapCalled = true
    }
    override func hotWaterTapDidReceiveTap() {
        hotWaterTapDidReceiveTapCalled = true
    }
}

class ViewControllerTests: XCTestCase {

    var sut: ViewController!
    var mockPresenter: MockPresenter!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "ViewController", bundle: NSBundle(forClass: self.dynamicType))
        sut = storyboard.instantiateInitialViewController() as? ViewController
        mockPresenter = MockPresenter()
        sut.presenter = mockPresenter
        let dummy = sut?.view
    }
    
    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasWaterLevelLabel() {
        XCTAssertNotNil(sut?.waterLevelLabel)
    }
    
    func testViewControllerUpdatesInterfaceOnWaterLevelUpdate() {
        sut.updateWaterLevel("50")
        var sameString = sut.waterLevelLabel?.text == "50"
        XCTAssertTrue(sameString)
    }
    
    func testViewControllerCallsViewDidUpdate() {
        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }
    
    //MARK: Cold Tap Interaction
    
    func testViewControllerCallsPresenterForColdWaterTapOpen() {
        sut.coldTapButtonDidReceiveTap()
        XCTAssertTrue(mockPresenter.coldWaterTapDidReceiveTapCalled)
    }
    
    func testColdTapButtonHasActionConnected() {
        let actions = sut.coldTapButton?.actionsForTarget(sut, forControlEvent: .TouchUpInside) as? [String]
        let hasAction = contains(actions!, "coldTapButtonDidReceiveTap")
        XCTAssertTrue(hasAction)
    }
    
    //MARK: Hot Tap Interaction
    
    func testViewControllerCallsPresenterForHotWaterTapOpen() {
        sut.hotTapButtonDidReceiveTap()
        XCTAssertTrue(mockPresenter.hotWaterTapDidReceiveTapCalled)
    }
    
    func testHotTapButtonHasActionConnected() {
        let actions = sut.hotTapButton?.actionsForTarget(sut, forControlEvent: .TouchUpInside) as? [String]
        let hasAction = contains(actions!, "hotTapButtonDidReceiveTap")
        XCTAssertTrue(hasAction)
    }

    func testTemperatureLabelOutletConnected() {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.temperatureLabel)
    }
    
    func testUpdatesTemperatureLabel() {
        sut.updateTemperature("20")
        let equalText = sut.temperatureLabel?.text == "20"
        XCTAssertTrue(equalText)
    }
    
}
