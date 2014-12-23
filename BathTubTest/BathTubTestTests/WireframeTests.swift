//
//  WireframeTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

class WireframeTests: XCTestCase {

    var view: View!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        class ViewClass: View {
            var presenter: Presenter! = nil
            private func updateWaterLevel(level: String) {
                
            }
        }
        view = ViewClass()
        Wireframe.configureModules(view)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
        
    func testWireframePresenterConnectedToView() {
        XCTAssertNotNil(view.presenter)
    }
    
    func testWireframeViewConnectedBackToPresenter() {
        let presenterView = view.presenter.view
        XCTAssertNotNil(presenterView)
    }
    
    func testWireframePresenterHasInteractorWhenInitialised() {
        let presenter = view.presenter
        XCTAssertNotNil(presenter.interactor)
    }
    
    func testWireframeInteractorDelegateIsCorrect() {
        let delegate = view.presenter.interactor.delegate
        XCTAssertTrue(delegate === view.presenter)
    }
    
    func testWireFrameInteractorHasBathModel() {
        XCTAssertNotNil(view.presenter.interactor.bath)
    }

}
