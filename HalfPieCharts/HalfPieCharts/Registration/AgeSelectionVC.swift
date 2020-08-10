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
    @IBOutlet weak var pickerWidth: NSLayoutConstraint!
    @IBOutlet weak var pickerHeight: NSLayoutConstraint!
    
    var arrayOfCountries = ["16","17","18","19", "20","21", "22", "23", "24","25","26","27", "28","29", "30", "31"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        createToolbar()
    }
    
    func setupConstraints() {
        pickerWidth.constant = view.frame.height / 2
        pickerHeight.constant = view.frame.height / 3
    }
    
    func createPickerView() {
        agePicker.delegate = self
        agePicker.delegate?.pickerView?(agePicker, didSelectRow: 0, inComponent: 0)
        textField1.inputView = agePicker
        agePicker.backgroundColor = UIColor.white
//        agePicker.layer.borderWidth = 3
//        agePicker.layer.borderColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
//        picker1.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        picker1.bottomAnchor.constraint(equalTo: .init(), constant: 90)
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor.black
        toolbar.backgroundColor = UIColor.clear
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AgeSelectionVC.closePickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        textField1.inputAccessoryView = toolbar
    }
    
    @objc func closePickerView() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return arrayOfCountries.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return arrayOfCountries[row] }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { textField1.text =  arrayOfCountries[row] }
    
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
}
