//
//  AlertLabel.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/25/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

enum AlertLabelType {
    case title
    case message
}

class AlertLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = UIColor.black
        textAlignment = .center
        numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(text: String, type: AlertLabelType) {
        self.init(frame: .zero)
        self.text = text
        setFont(for: type)
    }
    
    convenience init(attributedText: NSAttributedString, type: AlertLabelType) {
        self.init(frame: .zero)
        self.attributedText = attributedText
        setFont(for: type)
    }
    
    private func setFont(for type: AlertLabelType) {
        switch type {
        case .title:
            font = UIFont.alertTitleFont
        case .message:
            font = UIFont.alertMessageFont
        }
    }
    
}
