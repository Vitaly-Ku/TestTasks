//
//  SplashVC.swift
//  HalfPieCharts
//
//  Created by Vit K on 09.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }
}
