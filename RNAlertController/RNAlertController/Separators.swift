//
//  Separators.swift
//  alert-trial
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

class Separator: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

final class HorizontalSeparator: Separator {
    
    convenience init() {
        self.init(frame: .zero)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 0.5)
            ]
        )
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
