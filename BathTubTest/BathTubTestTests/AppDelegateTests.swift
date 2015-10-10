//
//  AppDelegateTests.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 19/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit
import XCTest

class AppDelegateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAppDelegateCallsWireframeOnDidFinishLaunching() {
        let appDelegate = AppDelegate()
        appDelegate.window = UIWindow(frame: CGRect.zero)
        let view = ViewController()
        appDelegate.window?.rootViewController = view
        appDelegate.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil)
        XCTAssertNotNil(view.presenter)
    }
}
