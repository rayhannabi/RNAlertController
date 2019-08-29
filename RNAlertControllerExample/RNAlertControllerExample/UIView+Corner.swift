//
//  UIView+Corner.swift
//  RNAlertControllerExample
//
//  Created by Rayhan Nabi on 8/28/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
}
