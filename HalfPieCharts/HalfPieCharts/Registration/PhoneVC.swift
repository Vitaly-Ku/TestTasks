//
//  PhoneVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 12.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class PhoneVC: UIViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    let user = Storage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createToolBarStartJob()
    }
    
    func createToolBarStartJob() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneActionStartJob))
        doneButton.setTitleTextAttributes(
            [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 27),
             NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        doneButton.setTitleTextAttributes(
        [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 25),
         NSAttributedString.Key.foregroundColor: UIColor.black], for: .highlighted)
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        phoneTextField.inputAccessoryView = toolBar
    }
    @objc func doneActionStartJob() {
        user.phone = phoneTextField.text!
        print(user.gender)
        print(user.age)
        print(user.weigh)
        print(user.height)
        print(user.phone)
        view.endEditing(true)
    }
}
