//
//  AlertButtonStackView.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

final class AlertButtonStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoresizingMask = [.flexibleHeight, .flexibleWidth]
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fill
        alignment = .fill
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(alertButtons: [AlertButton]) {
        var stackItems = [UIView]()
        for index in 0..<alertButtons.count {
            let alertButton = alertButtons[index]
            let button = UIButton(type: .system)
            
            let attributes = createAttributes(for: alertButton.type)
            let attributedString = NSAttributedString(string: alertButton.text, attributes: attributes)
            button.setAttributedTitle(attributedString, for: .normal)
            button.addAction(for: .touchUpInside, action: alertButton.action)
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 40)
                ]
            )
            stackItems.append(button)
            if index != alertButtons.count - 1 {
                if alertButtons.count == 2  {
                    stackItems.append(VerticalSeparator())
                } else {
                    stackItems.append(HorizontalSeparator())
                }
            }
        }
        
        self.init(arrangedSubviews: stackItems)
        axis = alertButtons.count == 2 ? .horizontal : .vertical
        if alertButtons.count == 2 {
            let firstItem = arrangedSubviews.first!
            let lastItem = arrangedSubviews.last!
            NSLayoutConstraint.activate([
                firstItem.widthAnchor.constraint(equalTo: lastItem.widthAnchor, multiplier: 1)
                ]
            )
        }
    }
    
}

fileprivate func createAttributes(for type: AlertButtonType) -> [NSAttributedString.Key: Any] {
    var attributes = [NSAttributedString.Key: Any]()
    switch type {
    case .cancel:
        attributes[.font] = UIFont.systemFont(ofSize: 15, weight: .bold)
    case .destructive:
        attributes[.foregroundColor] = UIColor.red
    default:
        break
    }
    
    return attributes
}
