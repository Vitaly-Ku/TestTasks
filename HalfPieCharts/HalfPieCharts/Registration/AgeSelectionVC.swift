//
//  AgeSelectionVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 09.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class AgeSelectionVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var pickerWidth: NSLayoutConstraint!
    @IBOutlet weak var pickerHeight: NSLayoutConstraint!
    @IBOutlet weak var stepTopConstr: NSLayoutConstraint!
    @IBOutlet weak var howOldTop: NSLayoutConstraint!
    @IBOutlet weak var descriptionTopConstr: NSLayoutConstraint!
    
    var arrayOfCountries = ["16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80+"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        setupButtons()
    }
    
    func setupConstraints() {
        pickerWidth.constant = view.frame.height / 2
        pickerHeight.constant = view.frame.height / 3
        stepTopConstr.constant = view.frame.height / 20
        howOldTop.constant = view.frame.height / 12
        descriptionTopConstr.constant = view.frame.height / 30
    }
    
    func createPickerView() {
        agePicker.delegate = self
        agePicker.delegate?.pickerView?(agePicker, didSelectRow: 0, inComponent: 0)
        agePicker.backgroundColor = UIColor.white
    }
    
    @objc func closePickerView() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return arrayOfCountries.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return arrayOfCountries[row] }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Storage.shared.age = arrayOfCountries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { return 100.0 }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { return 60.0 }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label:UILabel
        if let v = view as? UILabel{
            label = v
        } else {
            label = UILabel()
        }
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 45)
        label.text = arrayOfCountries[row]
        return label
    }
    
    func setupButtons() {
        continueButton.layer.borderColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
        continueButton.layer.borderWidth = 1
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        continueButton.setTitleColor(.mainDark, for: .normal)
        backButton.setTitleColor(.mainDark, for: .normal)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toWeigh", sender: self)
    }
}
