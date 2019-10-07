//
//  AlertDatePicker.swift
//  RNAlertController
//
//  Created by Rayhan on 7/10/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import UIKit

/// Action block to perform when a date is selected.
public typealias AlertDatePickerAction = (Date) -> Void

class AlertDatePicker: UIDatePicker {

    var action: AlertDatePickerAction?
    
    convenience init(datePickerMode: UIDatePicker.Mode,
                     selectedDate: Date? = nil) {
        self.init(frame: .zero)
        self.datePickerMode = datePickerMode
        self.date = selectedDate ?? Date()
        translatesAutoresizingMaskIntoConstraints = false
    }

}
