//
//  UIButton+Action.swift
//  alert-trial
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

@objc class AlertActionWrapper: NSObject {
    
    let alertAction: AlertAction
    
    init(_ action: @escaping AlertAction) {
        alertAction = action
        super.init()
    }
    
    @objc func invoke() {
        alertAction()
    }
    
}

extension UIButton {
    
    func addAction(for controlState: UIControl.Event, action: @escaping AlertAction) {
        let wrapper = AlertActionWrapper(action)
        addTarget(wrapper, action: #selector(wrapper.invoke), for: controlState)
        let objcAssocKey = String(ObjectIdentifier(self).hashValue) + String(controlState.rawValue)
        objc_setAssociatedObject(self, objcAssocKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
}
