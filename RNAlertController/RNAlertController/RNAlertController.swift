//
//  RNAlertController.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

public final class RNAlertController: UIViewController {
    
    typealias ButtonAction = () -> Void
    
    private var titleText: String?
    private var messageText: String?
    private var buttons: [AlertButton]?
    private var image: UIImage?
    private var pickerData: [String]?
    
    fileprivate var containerView: UIVisualEffectView!
    
    fileprivate override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(title: String?, message: String?) {
        self.init(nibName: nil, bundle: nil)
        buttons = [AlertButton]()
        titleText = title
        messageText = message
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        createAlertContainerView()
        createAlertBody()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateAlert()
    }
    
}

// MARK: - Private methods

fileprivate extension RNAlertController {
    
    func createAlertContainerView() {
        containerView = AlertContainerView()
        containerView.layer.opacity = 0.0
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
            ]
        )
    }
    
    func createTitleLabel() -> AlertLabel? {
        guard let title = titleText else { return nil }
        let titleLabel = AlertLabel(text: title, type: .title)
        return titleLabel
    }
    
    func createMessageLabel() -> AlertLabel? {
        guard let message = messageText else { return nil }
        let labelType: AlertLabelType = titleText == nil ? .title : .message
        let messageLabel = AlertLabel(text: message, type: labelType)
        return messageLabel
    }
    
    func createImageView() -> AlertImageView? {
        guard let image = image else { return nil }
        let imageView = AlertImageView(image: image)
        return imageView
    }
    
    func createPickerView() -> UIPickerView? {
        return nil
    }
    
    func createExtraStackView() -> AlertStackView {
        var extraStackItems = [UIView]()
        let imageView = createImageView()
        let pickerView = createPickerView()
        if imageView != nil {
            extraStackItems.append(imageView!)
        }
        if pickerView != nil {
            extraStackItems.append(pickerView!)
        }
        let extraStackView = AlertStackView(arrangedSubviews: extraStackItems)
        return extraStackView
    }
    
    func createAlertStackView() -> AlertStackView {
        var alertStackItems = [UIView]()
        let titleLabel = createTitleLabel()
        let messageLabel = createMessageLabel()
        if titleLabel != nil {
            alertStackItems.append(titleLabel!)
        }
        if messageLabel != nil {
            alertStackItems.append(messageLabel!)
        }
        let alertStackView = AlertStackView(arrangedSubviews: alertStackItems)
        return alertStackView
    }
    
    func createAlertBody() {
        let alertStack = createAlertStackView()
        containerView.contentView.addSubview(alertStack)
        NSLayoutConstraint.activate([
            alertStack.topAnchor.constraint(equalTo: containerView.contentView.topAnchor, constant: 16),
            alertStack.centerXAnchor.constraint(equalTo: containerView.contentView.centerXAnchor),
            alertStack.widthAnchor.constraint(equalTo: containerView.contentView.widthAnchor, multiplier: 0.8)
            ]
        )
        
        let extraStack = createExtraStackView()
        containerView.contentView.addSubview(extraStack)
        NSLayoutConstraint.activate([
            extraStack.topAnchor.constraint(equalTo: alertStack.bottomAnchor, constant: 8),
            extraStack.centerXAnchor.constraint(equalTo: containerView.contentView.centerXAnchor),
            extraStack.widthAnchor.constraint(equalTo: containerView.contentView.widthAnchor, multiplier: 0.85)
            ]
        )
        
        let separator = HorizontalSeparator()
        containerView.contentView.addSubview(separator)
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: extraStack.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: containerView.contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: containerView.contentView.trailingAnchor)
            ]
        )
        
        if let buttons = buttons, buttons.count > 0 {
            let buttonStack = AlertButtonStackView(alertButtons: buttons)
            containerView.contentView.addSubview(buttonStack)
            NSLayoutConstraint.activate([
                buttonStack.topAnchor.constraint(equalTo: separator.bottomAnchor),
                buttonStack.leadingAnchor.constraint(equalTo: containerView.contentView.leadingAnchor),
                buttonStack.trailingAnchor.constraint(equalTo: containerView.contentView.trailingAnchor),
                buttonStack.bottomAnchor.constraint(equalTo: containerView.contentView.bottomAnchor)
                ]
            )
        } else {
            NSLayoutConstraint.activate([
                separator.bottomAnchor.constraint(equalTo: containerView.contentView.bottomAnchor)
                ]
            )
            separator.isHidden = true
        }
    }
    
    
    func animateAlert() {
        containerView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
            self.containerView.transform = .identity
            self.containerView.layer.opacity = 1.0
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        }, completion: nil)
    }
    
}

// MARK: - Public API

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
    
    /// Adds a button to alert
    ///
    /// - Parameters:
    ///   - title: Title for the button
    ///   - type: Choose `.normal` for regular button, `.cancel` for bold button, `.destructive` for red button
    ///   - action: Block to run when the button is pressed (i.e. touchUpInside: action)
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func addButton(title: String, type: AlertButtonType = .normal , action: AlertAction? = nil) -> RNAlertController {
        let defaultAction = { self.dismiss(animated: true, completion: nil) }
        if let buttonAction = action {
            let button = AlertButton(text: title, type: type, action: buttonAction, dismiss: defaultAction)
            buttons?.append(button)
        } else {
            let button = AlertButton(text: title, type: type, action: defaultAction, dismiss: nil)
            buttons?.append(button)
        }
        
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
    /// - Parameter items: An array of *String* to represent picker data
    /// - Returns: *RNAlertController* instance
    @discardableResult
    func setPickerData(items: [String]) -> RNAlertController {
        pickerData = items
        return self
    }
    
}
