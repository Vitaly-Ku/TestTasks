//
//  Game.swift
//  Millionaire
//
//  Created by Vit K on 21.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

class Game {
    
    static let shared = Game()
    
    private let statisticCaretaker = StatCareTaker()
    
    private(set) var statistics: [Statistic] {
        didSet {
            statisticCaretaker.save(statics: statistics)
        }
    }
    
    func addStatistic(_ record: Statistic) {
        statistics.append(record)
    }
    
    var roundNumber = 0
    let totalRounds = 10
    var results = [String]()
    
    private init() {
        self.statistics = statisticCaretaker.load()
    }
}
