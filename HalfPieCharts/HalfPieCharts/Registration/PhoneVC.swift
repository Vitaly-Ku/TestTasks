//
//  PhoneVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 12.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class PhoneVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Storage.shared.gender)
        print(Storage.shared.age)
        print(Storage.shared.height)
    }
}
