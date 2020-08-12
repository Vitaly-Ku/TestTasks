//
//  WeighVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 10.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class WeighVC: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var stepTopConstr: NSLayoutConstraint!
    @IBOutlet weak var howHeightTop: NSLayoutConstraint!
    @IBOutlet weak var descriptionTopConstr: NSLayoutConstraint!
    @IBOutlet weak var bottomDescriptionTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    override func viewWillLayoutSubviews() {
        stepTopConstr.constant = view.frame.height / 20
        howHeightTop.constant = view.frame.height / 12
        descriptionTopConstr.constant = view.frame.height / 30
        bottomDescriptionTop.constant = view.frame.height / 3
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
