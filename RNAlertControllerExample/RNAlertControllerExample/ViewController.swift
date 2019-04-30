//
//  ViewController.swift
//  RNAlertControllerExample
//
//  Created by Rayhan Nabi on 4/29/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

import UIKit
import RNAlertController

class ViewController: UIViewController {

    @IBAction func didTapShowAlert(_ sender: UIButton) {
        let message = """
        Swift is a fantastic way to write software, whether it’s for phones, desktops, servers,
        or
        anything else that runs code.
        """
        RNAlertController(title: "Indira Memorial Tulip Garden, Kashmir", message: message)
            .addButton(title: "Ok")
            .addButton(title: "Cancel", type: .cancel, action: nil)
            .addButton(title: "Delete", type: .destructive, action: {
                print("deleted")
            })
            .present(on: self)
    }
    
}

