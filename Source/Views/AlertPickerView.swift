//
//  AlertPickerView.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 5/3/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import UIKit

/// An object which identifies the row of a picker view.
public class AlertPickerRow: NSObject {
    
    /// Selected index starting from 0.
    public let index: Int
    
    /// Title for the row.
    public let title: String
    
    init(index: Int, title: String) {
        self.index = index
        self.title = title
    }
}

/// Action block when a picker item is selected.
public typealias AlertPickerAction = (AlertPickerRow) -> Void

class AlertPickerView: UIPickerView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var pickerItems: [String]?
    private var pickerAction: AlertPickerAction?
    
    convenience init(items: [String], selectedIndex: Int = 0, action: AlertPickerAction? = nil) {
        self.init(frame: .zero)
        pickerItems = items
        pickerAction = action
        selectRow(selectedIndex, inComponent: 0, animated: true)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 120)
            ]
        )
    }
    
}

extension AlertPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItems?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickerRow = AlertPickerRow(index: row, title: pickerItems![row])
        pickerAction?(pickerRow)
    }
    
}
