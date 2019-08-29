//
//  AlertButton.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

/// Alert button type
///
/// - default: Regular button with standard text
/// - cancel: Bold button text
/// - destructive: Regular button with red colored text
@objc public enum AlertButtonType: Int {
    case `default` = 0
    case cancel
    case destructive
}

public typealias AlertAction = () -> Void

class AlertButton: NSObject {
    
    let text        : String
    let action      : AlertAction
    let type        : AlertButtonType
    
    init(text: String, type: AlertButtonType, action: @escaping AlertAction) {
        self.text = text
        self.action = action
        self.type = type
    }
    
}
