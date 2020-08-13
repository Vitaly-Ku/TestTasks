//
//  WeighVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 10.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class WeighVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var weighPicker: UIPickerView!
    @IBOutlet weak var weighNumberLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var stepTopConstr: NSLayoutConstraint!
    @IBOutlet weak var howHeightTop: NSLayoutConstraint!
    @IBOutlet weak var descriptionTopConstr: NSLayoutConstraint!
    @IBOutlet weak var bottomDescriptionTop: NSLayoutConstraint!
    
//    var gall: [UIImage] = [#imageLiteral(resourceName: "little"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "little"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "big"), #imageLiteral(resourceName: "big")]
    var gal: [String] = ["----","--","--","--","--","----","--","--","--","--","----","--","--","--","--","----","--","--","--","--","----","--","--","--","--"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        setupButtons()
    }
    
    override func viewWillLayoutSubviews() {
        stepTopConstr.constant = view.frame.height / 20
        howHeightTop.constant = view.frame.height / 12
        descriptionTopConstr.constant = view.frame.height / 30
        bottomDescriptionTop.constant = view.frame.height / 3
    }
    
    func createPickerView() {
        weighPicker.delegate = self
        weighPicker.delegate?.pickerView?(weighPicker, didSelectRow: 0, inComponent: 0)
        weighPicker.backgroundColor = UIColor.white
        weighPicker.selectRow(12, inComponent: 0, animated: true)
        weighPicker.transform = CGAffineTransform.init(rotationAngle: 90 * (.pi/180))
    }
    
    @objc func closePickerView() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return gal.count }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return gal[row] }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        Storage.shared.height = gall[row]
        weighNumberLabel.text = String(row) + " кг"
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { return 60 }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { return 16 }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let v = view as? UILabel {
            label = v
        } else {
            label = UILabel()
        }
//        label.image = gall[row]
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 33)
        label.text = gal[row]
//        label.layer.borderWidth = 3
//        label.layer.backgroundColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
//        label.layer.cornerRadius = 5
        return label
    }
    
    func setupButtons() {
        continueButton.layer.borderColor = CGColor.init(srgbRed: 49/255, green: 56/255, blue: 61/255, alpha: 1)
        continueButton.layer.borderWidth = 1
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        continueButton.setTitleColor(.mainDark, for: .normal)
        backButton.setTitleColor(.mainDark, for: .normal)
    }
    
    @IBAction func stepBack(segue: UIStoryboardSegue) {
        if segue.identifier == "backToWeigh " {
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toHeight", sender: self)
    }
}
