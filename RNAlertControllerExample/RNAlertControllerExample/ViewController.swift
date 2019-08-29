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
    
    let message = """
        Swift is a fantastic way to write software, whether it’s for phones, desktops, servers, or anything else that
        runs code.
        
        Tap "OK" to see magic.
        """

    fileprivate func nativeAlert() {
        let alertController = UIAlertController(title: "Indira Memorial Tulip Garden, Kashmir",
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
    }
    
    fileprivate func customAlertFull() {
        RNAlertController(title: "Indira Memorial Tulip Garden, Kashmir", message: message)
            .addOkButton()
            .addCancelButton()
            .addButton(title: "Delete", type: .destructive) {
                print("deleted")
            }
            .setBannerImage(UIImage(named: "mag-small")!)
            .setPickerData(items: ["Item", "World", "Sun", "Milky Way"], selectedRow: 1) { pickerRow in
                print("Chose row: \(pickerRow.index) item: \(pickerRow.title)")
            }
            .present(on: self)
    }
    
    fileprivate func customAlertLess() {
        RNAlertController(title: "Indira Memorial Tulip Garden, Kashmir", message: message)
            .addOkButton(action: {
                self.customAlertFull()
            })
            .addButton(title: "Cancel")
            .show()
    }
    
    @IBAction func didTapShowAlert(_ sender: UIButton) {
        customAlertLess()
//        nativeAlert()
    }
    
}

