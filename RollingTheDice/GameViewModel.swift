//
//  GameViewModel.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import Foundation

class GameViewModel: ObservableObject {
    private var game: DiceGame
    
    private var users = Users()
    
    private var timer = Timer()
    
    @Published var currentPlayer = User()
    @Published var isRolling: Bool = false
    @Published var diceNumber: [Int]
    
    init() {
        game = DiceGame(numberOfDice: 2)
        diceNumber = game.dicesNumber
    }
    
    private func resetTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { [self] _ in
            DispatchQueue.main.async {
                self.game.rollDices()
                self.diceNumber = self.game.dicesNumber
            }
        }
    }
    
    public func loadUser(name: String) {
        currentPlayer = users.loadUser(name: name)
    }
    
    public func restartGame() {
        game = DiceGame(numberOfDice: 2)
        diceNumber = game.dicesNumber
    }
    
    public func rollDices() {
        isRolling = true
        resetTimer()
    }
    
    public func stopRolling() {
        isRolling = false
        timer.invalidate()

        diceNumber = game.dicesNumber
        let totalPoint = diceNumber.reduce(0, +)
        
        if totalPoint > currentPlayer.highestPoint {
            currentPlayer.highestPoint = totalPoint
            users.updateUser(user: currentPlayer)
        }

    }
}
