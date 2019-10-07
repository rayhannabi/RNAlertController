//
//  RNAlertController.swift
//  RNAlertController
//
//  Created by Rayhan Nabi on 4/24/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit

/// An object that provides RNAlertController.
@objcMembers public final class RNAlertController: UIViewController {
        
    var titleText           : String?
    var messageText         : String?
    var buttons             : [AlertButton]?
    var image               : UIImage?
    var pickerData          : [String]?
    var pickerAction        : AlertPickerAction?
    var selectedPickerRow   : Int?
    var alertURL            : AlertURL?
    var alertDatePicker     : AlertDatePicker?
    
    private var alertWindow         : UIWindow?
    private var originalWindow      : UIWindow?
    private var container           : AlertContainerView!
    private var alertBodyBackground : UIView!
    
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        modalPresentationCapturesStatusBarAppearance = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Initializes the alert
    ///
    /// - Parameters:
    ///   - title: Title for the alert
    ///   - message: Message body of the alert
    public convenience init(title: String?, message: String?) {
        self.init(nibName: nil, bundle: nil)
        buttons = [AlertButton]()
        titleText = title
        messageText = message
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        createAlertContainer()
        createAlertBody()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateAlert()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if (alertDatePicker != nil) {
            alertDatePicker!.action?(alertDatePicker!.date)
        }
        originalWindow?.makeKeyAndVisible()
        alertWindow?.isHidden = true
        alertWindow = nil
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        alertBodyBackground.backgroundColor = alertBodyBackground.isDarkInterfaceStyle ?
            UIColor.defaultDarkBackground :
            UIColor.defaultLightBackground
    }
    
}

// MARK: - Presentation methods
extension RNAlertController {
    
    func presentOnViewController(_ viewController: UIViewController, completion: (() -> Void)?) {
        viewController.present(self, animated: false, completion: completion)
    }
    
    func presentOnWindow(completion: (() -> Void)?) {
        originalWindow = UIApplication.shared.delegate?.window!
        alertWindow = UIWindow(frame: originalWindow?.bounds ?? .zero)
        alertWindow?.rootViewController = UIViewController()
        let originalWindowLevel = originalWindow?.windowLevel.rawValue ?? 0.0
        alertWindow?.windowLevel = UIWindow.Level(rawValue: originalWindowLevel + 1)
        alertWindow?.makeKeyAndVisible()
        alertWindow?.rootViewController?.present(self, animated: false, completion: completion)
    }
    
}

// MARK: - Private methods
private extension RNAlertController {
    
    func createAlertContainer() {
        container = AlertContainerView()
        view.addSubview(container)
        var containerWidth: CGFloat = 0.0
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        if screenWidth < screenHeight {
            containerWidth = screenWidth * (alertDatePicker == nil ? 0.725 : 0.8)
        } else {
            containerWidth = screenHeight * (alertDatePicker == nil ? 0.725 : 0.8)
        }
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: containerWidth),
            container.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.8)
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
    
    func createPickerView() -> AlertPickerView? {
        guard let pickerData = pickerData,
            pickerData.count > 0 else {
                return nil
        }
        let alertPicker = AlertPickerView(items: pickerData,
                                          selectedIndex: selectedPickerRow ?? 0,
                                          action: pickerAction)
        return alertPicker
    }
    
    func createURLView() -> AlertURLButton? {
        guard let alertURL = alertURL else { return nil }
        let alertURLButton = AlertURLButton(alertURL)
        return alertURLButton
    }
    
    func createExtraStackView() -> AlertStackView {
        var extraStackItems = [UIView]()
        let imageView = createImageView()
        let pickerView = createPickerView()
        let urlView = createURLView()
        if imageView != nil {
            extraStackItems.append(imageView!)
        }
        if pickerView != nil {
            extraStackItems.append(pickerView!)
        }
        if urlView != nil {
            extraStackItems.append(urlView!)
        }
        if alertDatePicker != nil {
            extraStackItems.append(alertDatePicker!)
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
        let alertBody = UIStackView(frame: .zero)
        alertBody.translatesAutoresizingMaskIntoConstraints = false
        alertBody.axis = .vertical
        alertBody.distribution = .fill
        alertBody.alignment = .fill
        alertBody.spacing = 0.5
        
        container.contentView.addSubview(alertBody)
        NSLayoutConstraint.activate([
            alertBody.topAnchor.constraint(equalTo: container.contentView.topAnchor),
            alertBody.leadingAnchor.constraint(equalTo: container.contentView.leadingAnchor),
            alertBody.trailingAnchor.constraint(equalTo: container.contentView.trailingAnchor),
            alertBody.bottomAnchor.constraint(equalTo: container.contentView.bottomAnchor)
            ]
        )
        
        alertBodyBackground = UIView(frame: .zero)
        alertBodyBackground.backgroundColor = alertBodyBackground.isDarkInterfaceStyle ?
            UIColor.defaultDarkBackground :
            UIColor.defaultLightBackground
        alertBodyBackground.translatesAutoresizingMaskIntoConstraints = false
        
        let alertStack = createAlertStackView()
        alertBodyBackground.addSubview(alertStack)
        NSLayoutConstraint.activate([
            alertStack.topAnchor.constraint(equalTo: alertBodyBackground.topAnchor, constant: 20),
            alertStack.centerXAnchor.constraint(equalTo: alertBodyBackground.centerXAnchor),
            alertStack.widthAnchor.constraint(equalTo: alertBodyBackground.widthAnchor, multiplier: 0.85)
            ]
        )
        
        let extraStack = createExtraStackView()
        alertBodyBackground.addSubview(extraStack)
        NSLayoutConstraint.activate([
            extraStack.topAnchor.constraint(equalTo: alertStack.bottomAnchor, constant: 8),
            extraStack.centerXAnchor.constraint(equalTo: alertBodyBackground.centerXAnchor),
            extraStack.widthAnchor.constraint(equalTo: alertBodyBackground.widthAnchor, multiplier: 0.85),
            extraStack.bottomAnchor.constraint(equalTo: alertBodyBackground.bottomAnchor, constant: -12)
            ]
        )
        
        alertBody.addArrangedSubview(alertBodyBackground)
        if let buttons = buttons, buttons.count > 0 {
            let buttonStack = AlertButtonStackView(alertButtons: buttons)
            alertBody.addArrangedSubview(buttonStack)
        }
    }
    
    
    func animateAlert() {
        container.transform = CGAffineTransform(scaleX: 1.22, y: 1.22)
        self.container.isHidden = false
        UIView.animate(withDuration: 0.18, delay: 0.0, options: .curveEaseOut, animations: {
            self.container.layer.opacity = 1.0
            self.container.transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.18, animations: {
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
        })
    }
    
}
