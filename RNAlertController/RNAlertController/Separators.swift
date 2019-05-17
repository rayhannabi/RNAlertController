//
//  Separators.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

class Separator: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.gray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

final class HorizontalSeparator: Separator {
    
    convenience init() {
        self.init(frame: .zero)
        let heightConstraint = heightAnchor.constraint(equalToConstant: 0.5)
        heightConstraint.priority = .required
        NSLayoutConstraint.activate([heightConstraint])
    }
    
}

final class VerticalSeparator: Separator {
    
    convenience init() {
        self.init(frame: .zero)
        let widthConstraint = widthAnchor.constraint(equalToConstant: 0.5)
        widthConstraint.priority = .required
        NSLayoutConstraint.activate([widthConstraint])
    }
    
}
