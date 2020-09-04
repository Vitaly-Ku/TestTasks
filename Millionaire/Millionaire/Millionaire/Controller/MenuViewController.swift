//
//  MenuViewController.swift
//  Millionaire
//
//  Created by Vit K on 20.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stepBack(segue: UIStoryboardSegue) {
        if segue.identifier == "backToMenu " {
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        if let seg = segue.destination as? GameViewController {
        
        if segue.identifier == "consist" {
            seg.isRandomGame = false
            seg.view.backgroundColor = .red
            seg.consistGame()
        } else {
            seg.isRandomGame = true
            seg.view.backgroundColor = .green
            seg.randomGame()
        }
    }
    }
}
