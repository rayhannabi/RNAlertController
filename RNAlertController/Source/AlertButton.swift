//
//  AlertButton.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

/// Describes the appearances of the alert buttons.
@objc public enum AlertButtonType: Int {
    
    /// Apply the default style to the button.
    case `default` = 0
    /// Apply a style that indicates the action cancels the operation and leaves things unchanged.
    case cancel
    /// Apply a style that indicates the action might change or delete data.
    case destructive
}

/// Action block to perform when a button is pressed.
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
