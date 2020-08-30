//
//  GameViewController.swift
//  Millionaire
//
//  Created by Vit K on 20.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let round = RoundFactory.makeRound()
    let game = Game.shared
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1label: UILabel!
    @IBOutlet weak var answer2label: UILabel!
    @IBOutlet weak var answer3label: UILabel!
    @IBOutlet weak var answer4label: UILabel!
    @IBOutlet weak var toMenuButton: UIButton!
    
//    var onGameEnd: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toMenuButton.isHidden = true

        self.questionLabel.text = self.round[game.roundNumber].question
        self.answer1label.text = self.round[game.roundNumber].answer1
        self.answer2label.text = self.round[game.roundNumber].answer2
        self.answer3label.text = self.round[game.roundNumber].answer3
        self.answer4label.text = self.round[game.roundNumber].answer4
        
        let answer1tapped = UITapGestureRecognizer(target: self, action: #selector(answer1Chosen))
        let answer2tapped = UITapGestureRecognizer(target: self, action: #selector(answer2Chosen))
        let answer3tapped = UITapGestureRecognizer(target: self, action: #selector(answer3Chosen))
        let answer4tapped = UITapGestureRecognizer(target: self, action: #selector(answer4Chosen))
        
        answer1label.addGestureRecognizer(answer1tapped)
        answer2label.addGestureRecognizer(answer2tapped)
        answer3label.addGestureRecognizer(answer3tapped)
        answer4label.addGestureRecognizer(answer4tapped)
        
        answer1label.isUserInteractionEnabled = true
        answer2label.isUserInteractionEnabled = true
        answer3label.isUserInteractionEnabled = true
        answer4label.isUserInteractionEnabled = true
    }
    
    func checkResult(label: UILabel) {
        if label.text == round[game.roundNumber].rightAnswer {
            game.roundNumber += 1
            guard game.roundNumber < 10 else {
                questionLabel.text = "Вы выиграли!"
                game.results.append(String(game.roundNumber))
                clearAnswerFields()
                return
            }
            questionLabel.text = round[game.roundNumber].question
            answer1label.text = round[game.roundNumber].answer1
            answer2label.text = round[game.roundNumber].answer2
            answer3label.text = round[game.roundNumber].answer3
            answer4label.text = round[game.roundNumber].answer4
        } else {
            questionLabel.text = "Вы проиграли! Результат \(game.roundNumber) из \(game.totalRounds)"
            game.results.append(String(game.roundNumber))
            clearAnswerFields()
            toMenuButton.isHidden = false
        }
    }
    
    func clearAnswerFields() {
        answer1label.text = ""
        answer2label.text = ""
        answer3label.text = ""
        answer4label.text = ""
    }
    
    @objc func answer1Chosen() {
        checkResult(label: answer1label)
    }
    
    @objc func answer2Chosen() {
        checkResult(label: answer2label)
    }
    
    @objc func answer3Chosen() {
        checkResult(label: answer3label)
    }
    
    @objc func answer4Chosen() {
        checkResult(label: answer4label)
    }
}
