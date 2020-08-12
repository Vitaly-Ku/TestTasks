//
//  HeightVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 12.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class HeightVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var heighPicker: UIPickerView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var pickerWidth: NSLayoutConstraint!
    @IBOutlet weak var pickerHeight: NSLayoutConstraint!
    @IBOutlet weak var stepTopConstr: NSLayoutConstraint!
    @IBOutlet weak var howHeighTop: NSLayoutConstraint!
    @IBOutlet weak var descriptionTopConstr: NSLayoutConstraint!
    
    var heights = ["130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        setupButtons()
    }
    
    override func viewWillLayoutSubviews() {
        stepTopConstr.constant = view.frame.width / 3
        pickerHeight.constant = 150
        stepTopConstr.constant = view.frame.height / 20
        howHeighTop.constant = view.frame.height / 12
        descriptionTopConstr.constant = view.frame.height / 30
    }

    func createPickerView() {
        heighPicker.delegate = self
        heighPicker.delegate?.pickerView?(heighPicker, didSelectRow: 0, inComponent: 0)
        heighPicker.backgroundColor = UIColor.white
//        heighPicker.selectRow(20, inComponent: 0, animated: true)
    }
    
    @objc func closePickerView() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return heights.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return heights[row] }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Storage.shared.height = heights[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { return 80 }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { return 60.0 }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let v = view as? UILabel{
            label = v
        } else {
            label = UILabel()
        }
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 45)
        label.text = heights[row]
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
        if segue.identifier == "backToHeight " {
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toPhone", sender: self)
    }
}

