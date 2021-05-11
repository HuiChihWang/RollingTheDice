//
//  GameViewModel.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import Foundation

class GameViewModel: ObservableObject {
    private var game: DiceGame
    
    private var timer = Timer()
    
    
    @Published var isRolling: Bool = false
    @Published var diceNumber: [Int]
    
    init() {
        game = DiceGame(numberOfDice: 2)
        diceNumber = game.dicesNumber
    }
    
    private func resetTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [self] _ in
            DispatchQueue.main.async {
                self.game.rollDices()
                self.diceNumber = self.game.dicesNumber
            }
        }
    }
    
    public func rollDices() {
        isRolling = true
        resetTimer()
    }
    
    public func stopRolling() {
        isRolling = false
        timer.invalidate()

        diceNumber = game.dicesNumber
    }
}
