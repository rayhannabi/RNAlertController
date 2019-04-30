//
//  AlertButton.swift
//  alert-trial
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

public enum AlertButtonType {
    case normal
    case cancel
    case destructive
}

public typealias AlertAction = () -> Void

class AlertButton: NSObject {
    
    let text:       String
    let action:     AlertAction
    let dismiss:    AlertAction?
    let type:       AlertButtonType
    
    init(text: String, type: AlertButtonType, action: @escaping AlertAction, dismiss: (AlertAction)?) {
        self.text = text
        self.action = action
        self.dismiss = dismiss
        self.type = type
    }
    
}
