//
//  RNAlertControllerTests.swift
//  RNAlertControllerTests
//
//  Created by Rayhan Nabi on 9/3/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import XCTest
import RNAlertController

class RNAlertControllerTests: XCTestCase {
    
    var alertController: RNAlertController?
    
    override func setUp() {
        alertController = RNAlertController(title: "Test", message: "Test Message")
    }

    func testInitialization() {
        XCTAssertNotNil(alertController, "RNAlertController should be properly initialzied")
    }

}
