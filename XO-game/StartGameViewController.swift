//
//  StartGameViewController.swift
//  XO-game
//
//  Created by Vit K on 13.09.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func startPlayersGame(_ sender: UIButton) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        present(gameVC, animated: true, completion: nil)
    }
    
    @IBAction func startAiGame(_ sender: UIButton) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        gameVC.isAiGame = true
        present(gameVC, animated: true, completion: nil)
    }
    
    @IBAction func startFiveMovesGame(_ sender: UIButton) {
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
               gameVC.isFiveMoves = true
               present(gameVC, animated: true, completion: nil)
    }
}
