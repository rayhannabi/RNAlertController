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
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fill
        alignment = .fill
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(alertButtons: [AlertButton]) {
        var stackItems = createButtonCollection(from: alertButtons)
        let shouldUseVerticalAxis = adjustForOversizedText(buttonCollection: &stackItems)
        self.init(arrangedSubviews: stackItems)
        axis = (alertButtons.count == 2 && !shouldUseVerticalAxis) ? .horizontal : .vertical
        if alertButtons.count == 2 {
            setVerticalAxisButtonsConstraint()
        }
    }
    
    fileprivate func setVerticalAxisButtonsConstraint() {
        let firstItem = arrangedSubviews.first!
        let lastItem = arrangedSubviews.last!
        NSLayoutConstraint.activate([
            firstItem.widthAnchor.constraint(equalTo: lastItem.widthAnchor, multiplier: 1)
            ]
        )
    }
    
}

fileprivate func createAttributes(for type: AlertButtonType) -> [NSAttributedString.Key: Any] {
    var attributes = [NSAttributedString.Key: Any]()
    switch type {
    case .cancel:
        attributes[.font] = UIFont.systemFont(ofSize: 16, weight: .semibold)
    case .destructive:
        attributes[.font] = UIFont.systemFont(ofSize: 16, weight: .regular)
        attributes[.foregroundColor] = UIColor.red
    default:
        attributes[.font] = UIFont.systemFont(ofSize: 16, weight: .regular)
        break
    }
    
    return attributes
}

fileprivate func getDeviceWidthOrHeight(multiplier: CGFloat = 1.0) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    if screenWidth < screenHeight {
        return screenWidth * multiplier
    } else {
        return screenHeight * multiplier
    }
}

fileprivate func createButtonCollection(from alertButtons: [AlertButton]) -> [UIView] {
    var stackItems = [UIView]()
    for index in 0..<alertButtons.count {
        let alertButton = alertButtons[index]
        let button = UIButton(type: .system)
        let attributes = createAttributes(for: alertButton.type)
        let attributedString = NSAttributedString(string: alertButton.text, attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.addAction(for: .touchUpInside, action: alertButton.action)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 44)
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
    return stackItems
}

fileprivate func adjustForOversizedText(buttonCollection: inout [UIView]) -> Bool {
    let widthFactor = getDeviceWidthOrHeight(multiplier: 0.35)
    var shouldUseVerticalAxis = false
    if buttonCollection.count == 3 {
        for view in buttonCollection {
            if let textIntrinsicSize = (view as? UIButton)?.titleLabel?.intrinsicContentSize {
                if textIntrinsicSize.width > widthFactor {
                    buttonCollection.remove(at: 1)
                    buttonCollection.insert(HorizontalSeparator(), at: 1)
                    shouldUseVerticalAxis = true
                }
            }
        }
    }
    return shouldUseVerticalAxis
}
