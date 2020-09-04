//
//  Question.swift
//  Millionaire
//
//  Created by Vit K on 20.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

//protocol MakeRoundProtocol {
//    func makeRound() -> [Question]
//}

struct Question {
    
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String

    let rightAnswer: String
}

final class RoundFactoryConsistently {
    
    static func makeRound() -> [Question] {
        Data.setRound()
    }
}

final class RoundFactoryRandom {

    static func makeRound() -> [Question] {
        Data.setRound().shuffled()
    }
}
