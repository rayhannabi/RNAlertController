//
//  UIButton+Action.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

@objc class AlertActionWrapper: NSObject {
    
    let alertAction:    AlertAction
    let dismissAction:  AlertAction?
    
    init(_ action: @escaping AlertAction, dismissalAction: (AlertAction)?) {
        alertAction = action
        dismissAction = dismissalAction
        super.init()
    }
    
    @objc func invoke() {
        alertAction()
        dismissAction?()
    }
    
}

extension UIButton {
    
    func addAction(for controlState: UIControl.Event, action: @escaping AlertAction, dismiss: (AlertAction)?) {
        let wrapper = AlertActionWrapper(action, dismissalAction: dismiss)
        addTarget(wrapper, action: #selector(wrapper.invoke), for: controlState)
        let objcAssocKey = String(ObjectIdentifier(self).hashValue) + String(controlState.rawValue)
        objc_setAssociatedObject(self, objcAssocKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
}
