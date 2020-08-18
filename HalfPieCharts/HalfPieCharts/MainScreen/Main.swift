//
//  Main.swift
//  HalfPieCharts
//
//  Created by Vit K on 18.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class Main: UIViewController {
    
    let user = Storage.shared
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weighLabel: UILabel!
    @IBOutlet weak var heighLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderLabel.text = "Пол - \(user.gender)"
        ageLabel.text = "Возраст - \(user.age)"
        weighLabel.text = "Вес - \(user.weigh)"
        heighLabel.text = "Рост - \(user.height)"
        phoneLabel.text = "Телефон - \(user.phone)"
    }
}
