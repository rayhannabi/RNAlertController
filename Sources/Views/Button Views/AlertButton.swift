//
//  AlertButton.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 8/23/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import Foundation

class AlertButton: UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            setHighlightedColor()
        }
    }
    
    convenience init() {
        self.init(type: .custom)
        setBackgroundColor()
        setConstraint()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setBackgroundColor()
        setHighlightedColor()
    }
    
    func setTitle(_ title: String, for type: AlertButtonType) {
        let textAttributes = createAttributes(for: type)
        let attributedTitle = NSAttributedString(string: title, attributes: textAttributes)
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
}

private extension AlertButton {
    
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
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44)
            ]
        )
    }
    
    func setBackgroundColor() {
        backgroundColor = isDarkInterfaceStyle ? UIColor.defaultDarkBackground : UIColor.defaultLightBackground
    }
    
    func setHighlightedColor() {
        if isHighlighted {
            backgroundColor = isDarkInterfaceStyle ?
                UIColor.highlightedDarkBackground :
                UIColor.highlightedLightBackground
        } else {
            backgroundColor = isDarkInterfaceStyle ?
                UIColor.defaultDarkBackground :
                UIColor.defaultLightBackground
        }
    }
    
}
