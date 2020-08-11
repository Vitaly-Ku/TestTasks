//
//  GenderSelectionVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 09.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class GenderSelectionVC: UIViewController {
    
    @IBOutlet weak var manButton: UIButton!
    @IBOutlet weak var womanButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var stepTopConstr: NSLayoutConstraint!
    @IBOutlet weak var chooseSexTopConstr: NSLayoutConstraint!
    @IBOutlet weak var descriptionTopConstr: NSLayoutConstraint!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        makeContinueButtonDisable()
        manButton.setImage(#imageLiteral(resourceName: "man"), for: .normal)
        womanButton.setImage(#imageLiteral(resourceName: "woman"), for: .normal)
    }
    
    func setupConstraints() {
        stepTopConstr.constant = view.frame.height / 20
        chooseSexTopConstr.constant = view.frame.height / 12
        descriptionTopConstr.constant = view.frame.height / 30
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
    
    @IBAction func manButtonTapped(_ sender: UIButton) {
        changeContinueButtonState()
        manButton.isSelected = !manButton.isSelected
        guard manButton.isSelected else { return makeContinueButtonDisable() }
        womanButton.isSelected = false
        manButton.setImage(#imageLiteral(resourceName: "manHighlighted"), for: .selected)
    }
    
    @IBAction func womanButtonTapped(_ sender: UIButton) {
        changeContinueButtonState()
        womanButton.isSelected = !womanButton.isSelected
        guard womanButton.isSelected else { return makeContinueButtonDisable() }
        manButton.isSelected = false
        womanButton.setImage(#imageLiteral(resourceName: "womanHighlighted"), for: .selected)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        Storage.shared.gender = manButton.isSelected ? "male" : "female"
//        defaults.set(Storage.shared.gender, forKey: Keys.gender)
        self.performSegue(withIdentifier: "toAge", sender: self)
    }
    
    // func checkForSavedData() {
//        let startJob = defaults.value(forKey: Keys.startJob) as? String ?? ""
//        startJobTF.text = startJob
//        let vacationDaysPerYear = defaults.value(forKey: Keys.vacationDaysPerYear) as? String ?? ""
//        vacationDaysPerYearTF.text = vacationDaysPerYear
//    }
    
    @IBAction func stepBack(segue: UIStoryboardSegue) {
        if segue.identifier == "backToGender" {
//            let allGroupsTVC = segue.source as! AgeSelectionVC
        }
    }
}
