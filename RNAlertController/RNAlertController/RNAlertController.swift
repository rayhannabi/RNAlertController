//
//  RNAlertController.swift
//  alert-trial
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
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        createBlurredContainerView()
        createAlertBody()
    }
    
}

fileprivate extension RNAlertController {
    
    func createBlurredContainerView() {
        containerView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
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
    
    func createImageView() {
        
    }
    
    func createPickerView() {
        
    }
    
    func createAlertStackView() -> UIStackView {
        var alertStackItems = [UIView]()
        let titleLabel = createTitleLabel()
        let messageLabel = createMessageLabel()
        if titleLabel != nil {
            alertStackItems.append(titleLabel!)
        }
        if messageLabel != nil {
            alertStackItems.append(messageLabel!)
        }
        let alertStackView = UIStackView(arrangedSubviews: alertStackItems)
        alertStackView.translatesAutoresizingMaskIntoConstraints = false
        alertStackView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        alertStackView.axis = .vertical
        alertStackView.alignment = .fill
        alertStackView.distribution = .fill
        alertStackView.spacing = 8
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
        
        let separator = HorizontalSeparator()
        containerView.contentView.addSubview(separator)
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: alertStack.bottomAnchor, constant: 16),
            separator.leadingAnchor.constraint(equalTo: containerView.contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: containerView.contentView.trailingAnchor)
            ]
        )
        
        if let buttons = buttons, buttons.count > 0 {
            let buttonStack = ButtonStackView(alertButtons: buttons)
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
    
}

public extension RNAlertController {
    
    func present(on viewController: UIViewController, completion: (() -> Void)? = nil) {
        viewController.present(self, animated: true, completion: completion)
    }
    
    @discardableResult
    func addButton(title: String, type: AlertButtonType = .normal , action: AlertAction? = nil) -> RNAlertController {
        let defaultAction = { self.dismiss(animated: false, completion: nil) }
        if let buttonAction = action {
            let button = AlertButton(text: title, type: type, action: buttonAction, dismiss: defaultAction)
            buttons?.append(button)
        } else {
            let button = AlertButton(text: title, type: type, action: defaultAction, dismiss: nil)
            buttons?.append(button)
        }
        
        return self
    }
    
    @discardableResult
    func setImage(_ image: UIImage) -> RNAlertController {
        self.image = image
        return self
    }
    
    @discardableResult
    func setPickerData(items: [String]) -> RNAlertController {
        pickerData = items
        return self
    }
    
}
