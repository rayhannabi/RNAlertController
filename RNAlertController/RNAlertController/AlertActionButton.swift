//
//  AlertActionButton.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 8/23/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import Foundation

class AlertActionButton: UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.highlightedBackground : UIColor.defaultBackground
        }
    }
    
    convenience init() {
        self.init(type: .custom)
        backgroundColor = UIColor.defaultBackground
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44)
            ]
        )
    }
    
    func setTitle(_ title: String, for type: AlertButtonType) {
        let textAttributes = createAttributes(for: type)
        let attributedTitle = NSAttributedString(string: title, attributes: textAttributes)
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func createAttributes(for type: AlertButtonType) -> [NSAttributedString.Key: Any] {
        var attributes = [NSAttributedString.Key: Any]()
        switch type {
        case .cancel:
            attributes[.font] = UIFont.alertButtonFontBold
            attributes[.foregroundColor] = UIColor.alertButtonTextRegular
        case .destructive:
            attributes[.font] = UIFont.alertButtonFontRegular
            attributes[.foregroundColor] = UIColor.alertButtonTextDestructive
        case .default:
            attributes[.font] = UIFont.alertButtonFontRegular
            attributes[.foregroundColor] = UIColor.alertButtonTextRegular
        }
        return attributes
    }
    
}
