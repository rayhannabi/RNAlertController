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
    
    private var selectedDate: Date?
    
    @IBAction private func didTapAlert(_ sender: Any) {
        let text = "The word Kashmir was derived from the ancient Sanskrit language and was referred to as káśmīra."
        let attText = NSMutableAttributedString(string: text,
                                                attributes: [.font : UIFont.alertMessageFont ])
        attText.addAttribute(.link,
                             value: URL(string: "https://www.google.com/search?q=Kashmir")!,
                             range: NSRange(text.range(of: "Kashmir")!, in: text))
        attText.addAttribute(.font,
                             value: UIFont.alertMessageFontItalic,
                             range: NSRange(text.range(of: "Sanskrit")!, in: text))
        attText.addAttribute(.font,
                             value: UIFont.alertMessageFontBold,
                             range: NSRange(text.range(of: "káśmīra")!, in: text))
        
        RNAlertController(title: "Kashmir Valley", message: nil)
            .setAttributedMessageText(attText)
            .setBannerImage(UIImage(named: "crop")!, position: .beforeBody)
            .setCheckboxView(title: "Remember my choice", isSelected: true, action: { isSelected in
                print(isSelected)
            })
            .addOkButton()
            .present()
    }
    
    @IBAction func didTapChooseDate(_ sender: UIButton) {
        RNAlertController(title: "Pick a date",
                          message: "This date will be selected when you tap Done")
            .setDatePicker(mode: .date,
                           selectedDate: selectedDate,
                           maximumDate: Date()) { date in
                self.selectedDate = date
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMMM yyyy"
                sender.setTitle(formatter.string(from: date), for: .normal)
        }
        .addButton(title: "Done", type: .cancel, action: nil)
        .present()
    }
    
}
