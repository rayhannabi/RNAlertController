//
//  RNAlertController+API.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 5/8/19.
//  Copyright © 2019 Rayhan Nabi. All rights reserved.
//

import UIKit

public extension RNAlertController {
    
    /// Presents the alert on the specified view controller or a window.
    ///
    /// Use this method to present `RNAlertController` alert on a specific view controller. Passing `nil`
    /// for view controller will present the alert on a custom window.
    /// - Parameters:
    ///   - viewController: `UIViewController` where the alert is to be presented.
    ///   - completion: Block to run after presenting the alert.
    func present(on viewController: UIViewController? = nil, completion: (() -> Void)? = nil) {
        if let viewController = viewController {
            presentOnViewController(viewController, completion: completion)
        } else {
            presentOnWindow(completion: completion)
        }
    }
    
    /// Adds a button to the alert.
    ///
    /// - Parameters:
    ///   - title: Title for the button.
    ///   - type: Button style for the alert.
    ///   - action: Block to run when the button is pressed (i.e. touchUpInside: action).
    /// - Returns: `RNAlertController` instance.
    @discardableResult
    func addButton(title: String, type: AlertButtonType = .default, action: AlertAction? = nil) -> RNAlertController {
        let action = {
            self.dismiss(animated: true, completion: action)
        }
        let button = Button(text: title, type: type, action: action)
        buttons?.append(button)
        
        return self
    }
    
    /// Sets attributed text for the message.
    ///
    /// When set, message text will use attributed text instead of regular text.
    /// - Parameter attributedText: Attributed string to set.
    @discardableResult func setAttributedTextForMessage(_ attributedText: NSAttributedString?) -> RNAlertController {
        self.attributedMessage = attributedText
        return self
    }
    
    /// Adds an **OK** button to the alert.
    ///
    /// - Parameter action: Block to run when the button is pressed (i.e. touchUpInside event).
    /// - Returns: `RNAlertController` instance.
    @discardableResult
    func addOkButton(action: AlertAction? = nil) -> RNAlertController {
        return addButton(title: "OK", type: .default, action: action)
    }
    
    /// Adds a **Cancel** button to the alert.
    ///
    /// - Parameter action: Block to run when the button is pressed (i.e. touchUpInside event).
    /// - Returns: `RNAlertController` instance.
    @discardableResult
    func addCancelButton(action: AlertAction? = nil) -> RNAlertController {
        return addButton(title: "Cancel", type: .cancel, action: action)
    }
    
    /// Sets the banner image for the alert.
    ///
    /// Banner image is displayed under the message body.
    /// Consequent calls of this method will result in replacement of previously set image.
    /// - Parameter image: image to use in the alert.
    /// - Parameter position: determines the position of the image.
    /// - Returns: RNAlertController` instance.
    @discardableResult
    func setBannerImage(_ image: UIImage, position: AlertBannerPosition = .afterBody) -> RNAlertController {
        self.image = image
        self.imagePosition = position
        return self
    }
    
    /// Sets picker view data for the alert.
    ///
    /// - Note: Consequent calls of this method will result in replacement of previously set picker data.
    /// - Parameters:
    ///   - items: An array of `String` to represent picker data collection.
    ///   - selectedRow: Row to be selected. The default value is 0 (zero)
    ///     indicating the first item in the collection.
    ///   - selectionAction: Block to execute when an item is selected.
    /// - Returns: `RNAlertController` instance.
    @discardableResult
    func setPickerData(items: [String], selectedRow: Int = 0, selectionAction: AlertPickerAction?) -> RNAlertController {
        pickerData = items
        pickerAction = selectionAction
        selectedPickerRow = selectedRow
        return self
    }
    
    /// Sets a button with an URL.
    ///
    /// A button is placed under the message body. Consequent calls of this method will result in
    /// replacement of previously set URL.
    /// - Parameters:
    ///   - urlString: `String` representation of the URL.
    ///   - text: Placeholder for the URL. If `nil` is passed, original URL will be used.
    /// - Returns: `RNAlertController` instance.
    @discardableResult
    func setURL(urlString: String, text: String? = nil) -> RNAlertController {
        let url = URL(string: urlString)
        let altText = text != nil ? text! : urlString
        alertURL = AlertURL(url: url, text: altText)
        return self
    }
    
    /// Sets a date picker with a selected date.
    ///
    /// A date picker is placed under the message body.
    /// - Parameters:
    ///     - mode: `UIDatePicker.Mode` describing the mode displayed the date picker.
    ///     - selectedDate: `Date` to set. If passed `nil`, current date is used.
    ///     - maximumDate: Maximum date that a date picker can show.
    ///     - minimumDate: Minimum date that a date picker can show.
    ///     - selectionAction: Block to execute when date is selected.
    /// - Returns: `RNAlertController` instance.
    @discardableResult
    func setDatePicker(mode: UIDatePicker.Mode,
                       selectedDate: Date? = nil,
                       maximumDate: Date? = nil,
                       minimumDate: Date? = nil,
                       selectionAction: AlertDatePickerAction? = nil) -> RNAlertController {
        alertDatePicker = AlertDatePicker(datePickerMode: mode, selectedDate: selectedDate)
        alertDatePicker?.maximumDate = maximumDate
        alertDatePicker?.minimumDate = minimumDate
        alertDatePicker?.action = selectionAction
        return self
    }
    
}
