//
//  PresenterTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 23/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

class MockView: View {
    var presenter: Presenter! = nil
    var updateWaterLevelCalled = false
    var levelString: String!
    func updateWaterLevel(level: String) {
        updateWaterLevelCalled = true
        levelString = level
    }
}

class MockInteractor: Interactor {
    var fetchWaterLevelCalled = false
    var openColdTapCalled = false
    override func fetchWaterLevel() {
        fetchWaterLevelCalled = true
    }
    override func openColdTap() {
        openColdTapCalled = true
    }
}

class PresenterTests: XCTestCase {

    let presenter = Presenter()
    let mockView = MockView()
    let mockInteractor = MockInteractor()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter.view = mockView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPresenterCallsViewUpdateForWaterLevel() {
        presenter.updateWaterLevel(0)
        XCTAssertTrue(mockView.updateWaterLevelCalled)
    }
    
    func testPresenterPassCorrectStringForWaterLevel() {
        presenter.updateWaterLevel(102.7)
        XCTAssertEqual(mockView.levelString, "102.7")
    }
    
    func testPresenterAsksInteractorToFetchWaterLevelOnViewDidLoad() {
        presenter.interactor = mockInteractor
        presenter.viewDidLoad()
        XCTAssertTrue(mockInteractor.fetchWaterLevelCalled)
    }
    
    func testPresenterTellsInteractorToOpenColdTap() {
        presenter.interactor = mockInteractor
        presenter.coldWaterTapDidOpen()
        XCTAssertTrue(mockInteractor.openColdTapCalled)
    }
}
