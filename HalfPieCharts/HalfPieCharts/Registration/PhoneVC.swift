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
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var stepTopConstr: NSLayoutConstraint!
    @IBOutlet weak var askPhoneonstr: NSLayoutConstraint!
    @IBOutlet weak var descriptionTopConstr: NSLayoutConstraint!
    
    let user = Storage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createToolBar()
        setupButtons()
        makeContinueButtonDisable()
    }
    
    override func viewWillLayoutSubviews() {
        stepTopConstr.constant = view.frame.height / 20
        askPhoneonstr.constant = view.frame.height / 12
        descriptionTopConstr.constant = view.frame.height / 30
    }
    
    func createToolBar() {
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
        guard phoneTextField.text?.count == 12 else {
            print("incorrect phone number")
            return showUncorrectNumberError()
        }
        changeContinueButtonState()
        user.phone = phoneTextField.text!
        print(user.gender)
        print(user.age)
        print(user.weigh)
        print(user.height)
        print(user.phone)
        view.endEditing(true)
    }
    
    func makeContinueButtonDisable() {
        continueButton.setTitleColor(.mainDark, for: .normal)
        continueButton.alpha = 0.5
        continueButton.isEnabled = false
    }
    
    func changeContinueButtonState() {
        continueButton.layer.borderColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
        continueButton.layer.borderWidth = 1
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        continueButton.alpha = 1
        continueButton.isEnabled = true
    }
    
    func showUncorrectNumberError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введите номер телефона в формате (xxx) xxx xx xx", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func setupButtons() {
        continueButton.layer.borderColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
        continueButton.layer.borderWidth = 1
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        continueButton.setTitleColor(.mainDark, for: .normal)
        backButton.setTitleColor(.mainDark, for: .normal)
    }
    
    @IBAction func stepBack(segue: UIStoryboardSegue) {
        if segue.identifier == "backToEnterPhone " {
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toCall", sender: self)
    }
}
