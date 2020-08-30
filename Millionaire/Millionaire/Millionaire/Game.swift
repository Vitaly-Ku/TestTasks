//
//  Game.swift
//  Millionaire
//
//  Created by Vit K on 21.08.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

class Game {
    private init() {}
    
    public static let shared = Game()
    
    var roundNumber = 0
    let totalRounds = 10
    var results = [String]()
}
