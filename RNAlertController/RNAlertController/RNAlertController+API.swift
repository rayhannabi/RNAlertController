//
//  RNAlertController+API.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 5/8/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import UIKit

public extension RNAlertController {
    
    /// Presents alert on specified View Controller
    ///
    /// Always use this method to present *RNAlertController* alert
    /// - Parameters:
    ///   - viewController: *UIViewController* where the alert is to be presented
    ///   - completion: Block to run after presenting the alert
    func present(on viewController: UIViewController, completion: (() -> Void)? = nil) {
        viewController.present(self, animated: false, completion: completion)
    }
    
    func show(animated: Bool = true, completion: (() -> Void)? = nil) {
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow?.rootViewController = UIViewController()
        let appDelegate = UIApplication.shared.delegate
        if let window = appDelegate?.window, window != nil {
            alertWindow?.tintColor = window?.tintColor
        }
        alertWindow?.windowLevel = .alert
        alertWindow?.makeKeyAndVisible()
        alertWindow?.rootViewController?.present(self, animated: animated, completion: completion)
    }
    
    /// Adds a button to alert
    ///
    /// - Parameters:
    ///   - title: Title for the button
    ///   - type: Choose `.normal` for regular button, `.cancel` for bold button, `.destructive` for red button
    ///   - action: Block to run when the button is pressed (i.e. touchUpInside: action)
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func addButton(title: String, type: AlertButtonType = .normal , action: AlertAction? = nil) -> RNAlertController {
        let action = {
            self.dismiss(animated: true, completion: action)
        }
        let button = AlertButton(text: title, type: type, action: action)
        buttons?.append(button)
        
        return self
    }
    
    /// Adds an OK button to alert
    ///
    /// - Parameter action: Block to run when the button is pressed (i.e. touchUpInside: action)
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func addOkButton(action: AlertAction? = nil) -> RNAlertController {
        return addButton(title: "OK", type: .normal, action: action)
    }
    
    /// Adds a Cancel button to alert
    ///
    /// - Parameter action: Block to run when the button is pressed (i.e. touchUpInside: action)
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func addCancelButton(action: AlertAction? = nil) -> RNAlertController {
        return addButton(title: "Cancel", type: .cancel, action: action)
    }
    
    /// Sets image for the alert
    ///
    /// Multiple calls of this method will result in replacement of previously set image
    /// - Parameter image: image to use in alert
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func setImage(_ image: UIImage) -> RNAlertController {
        self.image = image
        return self
    }
    
    /// Sets picker view data for the alert
    ///
    /// Multiple calls of this method will result in replacement of previously set picker data
    /// - Parameters:
    ///   - items: An array of *String* to represent picker data
    ///   - selectedRow: Row to be selected, defaults to 0 (zero) indicating the first item from options
    ///   - selectionAction: Block to execute when an item is selected
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func setPickerData(items: [String], selectedRow: Int = 0, selectionAction: AlertPickerAction?) -> RNAlertController {
        pickerData = items
        pickerAction = selectionAction
        selectedPickerRow = selectedRow
        return self
    }
    
    /// Sets a button with URL
    ///
    /// - Parameters:
    ///   - urlString: *String* representation of the URL
    ///   - text: Placeholder for the URL
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func setURL(urlString: String, text: String) -> RNAlertController {
        let url = URL(string: urlString)
        alertURL = AlertURL(url: url, text: text)
        return self
    }
    
}
