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
            .setImage(UIImage(named: "mag-small")!)
            .setPickerData(items: ["Item", "World", "Sun", "Milky Way"], selectedRow: 1, selectionAction: { pickerRow in
                print("Chose row: \(pickerRow.index) item: \(pickerRow.title)")
            })
            .present(on: self)
//        let alertController = UIAlertController(title: "Test", message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(action)
//        present(alertController, animated: true, completion: nil)
    }
    
}

