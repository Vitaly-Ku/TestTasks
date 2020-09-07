//
//  GameViewController.swift
//  Millionaire
//
//  Created by Vit K on 20.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let roundConsist = RoundFactoryConsistently.makeRound()
    let roundRandom = RoundFactoryRandom.makeRound()
    let game = Game.shared
    var isRandomGame = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1label: UILabel!
    @IBOutlet weak var answer2label: UILabel!
    @IBOutlet weak var answer3label: UILabel!
    @IBOutlet weak var answer4label: UILabel!
    @IBOutlet weak var toMenuButton: UIButton!
    @IBOutlet weak var numberRoundLabel: UILabel!
    
//    var onGameEnd: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toMenuButton.isHidden = true
        setupLabels()
        numberRoundLabel.text = "Вопрос № \(game.roundNumber + 1) из \(game.totalRounds)"
    }
    
    func consistGame() {
        self.questionLabel.text = self.roundConsist[game.roundNumber].question
        self.answer1label.text = self.roundConsist[game.roundNumber].answer1
        self.answer2label.text = self.roundConsist[game.roundNumber].answer2
        self.answer3label.text = self.roundConsist[game.roundNumber].answer3
        self.answer4label.text = self.roundConsist[game.roundNumber].answer4
    }
    
    func randomGame() {
        self.questionLabel.text = self.roundRandom[game.roundNumber].question
        self.answer1label.text = self.roundRandom[game.roundNumber].answer1
        self.answer2label.text = self.roundRandom[game.roundNumber].answer2
        self.answer3label.text = self.roundRandom[game.roundNumber].answer3
        self.answer4label.text = self.roundRandom[game.roundNumber].answer4
    }
    
    func setupLabels() {
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
    
    func checkResultForConsistGame(label: UILabel) {
        numberRoundLabel.text = "Вопрос № \(game.roundNumber + 2) из \(game.totalRounds)"
        if label.text == roundConsist[game.roundNumber].rightAnswer {
            game.roundNumber += 1
            guard game.roundNumber < 10 else {
                questionLabel.text = "Вы выиграли! \(game.roundNumber) из \(game.totalRounds)"
                numberRoundLabel.isHidden = true
                endGameSetup()
                return
            }
            consistGame()
        } else {
            questionLabel.text = "Вы проиграли! Результат \(game.roundNumber) из \(game.totalRounds)"
            endGameSetup()
        }
    }
    
    func checkResultForRandomGame(label: UILabel) {
        numberRoundLabel.text = "Вопрос № \(game.roundNumber + 2) из \(game.totalRounds)"
        if label.text == roundRandom[game.roundNumber].rightAnswer {
            game.roundNumber += 1
            guard game.roundNumber < 10 else {
                questionLabel.text = "Вы выиграли! \(game.roundNumber) из \(game.totalRounds)"
                numberRoundLabel.isHidden = true
                endGameSetup()
                return
            }
            randomGame()
        } else {
            questionLabel.text = "Вы проиграли! Результат \(game.roundNumber) из \(game.totalRounds)"
            endGameSetup()
        }
    }
    
    func endGameSetup() {
        let record = Statistic(date: Date(), score: "\(game.roundNumber) из \(game.totalRounds)")
        Game.shared.addStatistic(record)
        game.results.append(String(game.roundNumber))
        clearAnswerFields()
        toMenuButton.isHidden = false
        game.roundNumber = 0
    }
    
    func clearAnswerFields() {
        answer1label.text = ""
        answer2label.text = ""
        answer3label.text = ""
        answer4label.text = ""
    }
    
    @objc func answer1Chosen() {
        guard isRandomGame else { return checkResultForConsistGame(label: answer1label) }
        checkResultForRandomGame(label: answer1label)
    }
    
    @objc func answer2Chosen() {
        guard isRandomGame else { return checkResultForConsistGame(label: answer2label) }
        checkResultForRandomGame(label: answer2label)
    }
    
    @objc func answer3Chosen() {
        guard isRandomGame else { return checkResultForConsistGame(label: answer3label) }
        checkResultForRandomGame(label: answer3label)
    }
    
    @objc func answer4Chosen() {
        guard isRandomGame else { return checkResultForConsistGame(label: answer4label) }
        checkResultForRandomGame(label: answer4label)
    }
}
