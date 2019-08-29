//
//  OtherViewController.swift
//  RNAlertControllerExample
//
//  Created by Rayhan Nabi on 8/28/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit
import RNAlertController

class OtherViewController: UIViewController {
    
    @IBAction private func didTapAlert(_ sender: Any) {
        let message = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
        RNAlertController(title: "Kashmir Valley", message: message)
            .setBannerImage(UIImage(named: "crop")!)
            .addOkButton()
            .show()
    }

}
