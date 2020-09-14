//
//  GameViewController.swift
//  XO-game
//
//  Created by Evgeny Kireev on 25/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    private let gameboard = Gameboard()
    private var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    var isAiGame : Bool = false
    var isFiveMoves : Bool = false
    private lazy var referee = Referee(gameboard: self.gameboard)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goToFirstState()
        if isFiveMoves {
            DrawInvoker.shared.setGameboard(gameboard: gameboard, gameboardView: gameboardView)
        }
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            if self.isFiveMoves {
                self.fiveStateGame(at: position)
            } else {
                self.currentState.addMark(at: position)
                if self.currentState.isCompleted {
                    if self.isAiGame{
                        self.goToNextStateWithAi()
                    } else {
                        self.goToNextState()
                    }
                }
            }
        }
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        self.goToFirstState()
        gameboard.clear()
        gameboardView.clear()
        DrawInvoker.shared.setGameboard(gameboard: gameboard, gameboardView: gameboardView)
    }
    
    private func goToFirstState() {
        let player = Player.first
        if isFiveMoves {
            self.currentState = FiveMovesState(player: player,
                                               markViewPrototype: player.markViewPrototype,
                                               gameViewController: self,
                                               gameboard: gameboard,
                                               gameboardView: gameboardView)
        } else {
            self.currentState = PlayerInputState(player: player,
                                                 markViewPrototype: player.markViewPrototype,
                                                 gameViewController: self,
                                                 gameboard: gameboard,
                                                 gameboardView: gameboardView)
        }
    }
    
    private func goToNextState() {
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameViewController: self)
            return
        }
        if let playerInputState = currentState as? PlayerInputState {
            let player = playerInputState.player.next
            self.currentState = PlayerInputState(player: player,
                                                 markViewPrototype: player.markViewPrototype,
                                                 gameViewController: self,
                                                 gameboard: gameboard,
                                                 gameboardView: gameboardView)
        }
    }
    
    private func goToNextStateWithAi(){
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameViewController: self)
            return
        }
        
        if !(currentState is PlayerInputState && isAiGame) {
            let player = Player.first
            self.currentState = PlayerInputState(player: player,
                                                 markViewPrototype: player.markViewPrototype,
                                                 gameViewController: self,
                                                 gameboard: gameboard,
                                                 gameboardView: gameboardView)
        } else {
            let player = Player.second
            self.currentState = AIInputState(player: player,
                                             markViewPrototype: player.markViewPrototype,
                                             gameViewController: self,
                                             gameboard: gameboard,
                                             gameboardView: gameboardView)
            self.currentState.addMark(at: GameboardPosition(column: 0, row: 0))
            if self.currentState.isCompleted {
                self.goToNextStateWithAi()
            }
        }
        
        
    }
    
    private func fiveStateGame(at position : GameboardPosition){
        self.currentState.addMark(at: position)
        if self.gameboard.isFullMoves(for: (self.currentState as! FiveMovesState).player) {
            if (self.currentState as! FiveMovesState).player == .second && self.currentState.isCompleted {
                if let winner = self.referee.determineWinner() {
                    self.currentState = GameEndedState(winner: winner, gameViewController: self)
                    return
                }
                return
            }
            if let playerInputState = self.currentState as? FiveMovesState {
                self.gameboardView.clear()
                let player = playerInputState.player.next
                self.currentState = FiveMovesState(player: player,
                                                   markViewPrototype: player.markViewPrototype,
                                                   gameViewController: self,
                                                   gameboard: self.gameboard,
                                                   gameboardView: self.gameboardView)
            }
        }
    }
}

