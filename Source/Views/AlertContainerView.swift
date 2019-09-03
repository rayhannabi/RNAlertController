//
//  AlertContainerView.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 5/2/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import UIKit

class AlertContainerView: UIVisualEffectView {
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        translatesAutoresizingMaskIntoConstraints = false
        autoresizingMask =  [.flexibleHeight]
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(effect: UIBlurEffect(style: .light))
    }
    
}