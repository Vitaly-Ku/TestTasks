//
//  CallVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 17.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class CallVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var callTpo: NSLayoutConstraint!
    @IBOutlet weak var descriptionTop: NSLayoutConstraint!
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var number4: UITextField!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    var users4numbers = ""
    var requiredNumber = "7777"
    var count = 30
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestCallToUser()
        setupTextFields()
        setupButtons()
        makeContinueButtonDisable()
        retryButton.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        callTpo.constant = view.frame.height / 7
        descriptionTop.constant = view.frame.height / 30
    }
    
    func requestCallToUser() {
        print("отправить запрос на звонок")
        // TODO: запрос на сервер для звонка пользователю
    }
    
    @objc func countdownTimer() {
        countdownLabel.text = "Повторить через: \(count) секунд"
        count -= 1
        guard count < 0 else { return }
        countdownLabel.isHidden = true
        retryButton.isHidden = false
        
        timer.invalidate()
    }
    
    func setupTextFields() {
        number1.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingChanged)
        number2.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingChanged)
        number3.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingChanged)
        number4.addTarget(self, action: #selector(textFieldShouldReturn), for: .editingChanged)
        number1.delegate = self
        number1.tag = 0
        number2.delegate = self
        number2.tag = 1
        number3.delegate = self
        number3.tag = 2
        number4.delegate = self
        number4.tag = 3
    }
    
    func checkCorrectNumber() {
        if users4numbers == requiredNumber {
            changeContinueButtonState()
            countdownLabel.isHidden = true
            retryButton.isHidden = true
//            timer.invalidate()
        } else {
            showUncorrectNumberError()
            makeContinueButtonDisable()
            number1.text = ""
            number2.text = ""
            number3.text = ""
            number4.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            
            users4numbers = number1.text! + number2.text! + number3.text! + number4.text!
            checkCorrectNumber()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownTimer), userInfo: nil, repeats: true)
        }
        return false
    }
    
    func showUncorrectNumberError() {
        let alert = UIAlertController(title: "Ошибка", message: "Последние 4 цифры не совпадают", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
    
    @IBAction func retryButtonTapped(_ sender: UIButton) {
        requestCallToUser()
        count = 30
        countdownLabel.isHidden = false
        retryButton.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownTimer), userInfo: nil, repeats: true)
    }
    
    
    func setupButtons() {
        retryButton.setTitleColor(.mainDark, for: .normal)
        continueButton.layer.borderColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
        continueButton.layer.borderWidth = 1
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        continueButton.setTitleColor(.mainDark, for: .normal)
        backButton.setTitleColor(.mainDark, for: .normal)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toWellcome", sender: self)
    }

}
