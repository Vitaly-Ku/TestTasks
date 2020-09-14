//
//  GameState.swift
//  XO-game
//
//  Created by Vit K on 13.09.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

public protocol GameState {
    var isCompleted: Bool { get }
    func begin()
    func addMark(at position: GameboardPosition?)
}

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
