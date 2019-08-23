//
//  UIFont+Extra.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/25/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

extension UIFont {
    
    class var alertTitleFont: UIFont {
        return self.systemFont(ofSize: 18, weight: .semibold)
    }
    
    class var alertMessageFont: UIFont {
        return self.systemFont(ofSize: 14, weight: .regular)
    }
    
    class var alertButtonFontRegular: UIFont {
        return self.systemFont(ofSize: 17, weight: .regular)
    }
    
    class var alertButtonFontBold: UIFont {
        return self.systemFont(ofSize: 17, weight: .semibold)
    }
    
}
