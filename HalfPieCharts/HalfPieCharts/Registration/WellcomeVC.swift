//
//  WellcomeVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 17.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class WellcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "toMain", sender: self)
        }
    }
}
