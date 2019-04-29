//
//  UIFont+Extra.swift
//  alert-trial
//
//  Created by Rayhan Nabi on 4/25/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

extension UIFont {
    
    class var alertTitleFont: UIFont {
        return self.systemFont(ofSize: 16, weight: .bold)
    }
    
    class var alertMessageFont: UIFont {
        return self.systemFont(ofSize: 13, weight: .regular)
    }
    
}
