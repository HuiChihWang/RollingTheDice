//
//  GameViewModel.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import Foundation

class GameViewModel: ObservableObject {
    private var game: DiceGame
    
    @Published var diceNumber: [Int]
    
    init() {
        game = DiceGame(numberOfDice: 2)
        diceNumber = game.dicesNumber
    }
    
    public func rollDices() {
        game.rollDices()
        diceNumber = game.dicesNumber
    }
}
