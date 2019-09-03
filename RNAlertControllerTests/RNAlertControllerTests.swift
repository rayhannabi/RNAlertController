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
    
    func testOkButton() {
        alertController = alertController?.addOkButton()
        XCTAssertNotNil(alertController, "OK button should be added properly")
    }
    
    func testCancelButton() {
        alertController = alertController?.addCancelButton()
        XCTAssertNotNil(alertController, "Cancel button should be added properly")
    }
    
    func testCustomButton() {
        alertController = alertController?.addButton(title: "Delete", type: .destructive, action: nil)
        XCTAssertNotNil(alertController, "Delete button should added properly")
    }

}
