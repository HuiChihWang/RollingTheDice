//
//  GameViewModel.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import Foundation

class GameViewModel: ObservableObject {
    private var game: DiceGame
    
    @Published var isRolling: Bool = false
    @Published var diceNumber: [Int]
    
    init() {
        game = DiceGame(numberOfDice: 2)
        diceNumber = game.dicesNumber
    }
    
    public func rollDices() {
        isRolling = true
        
        DispatchQueue.global().async { [self] in
            while (isRolling) {
                DispatchQueue.main.async {
                    game.rollDices()
                    diceNumber = game.dicesNumber
                }
            }
        }
    }
    
    public func stopRolling() {
        isRolling = false
    }
}
