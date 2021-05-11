//
//  DiceGame.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import Foundation

class Dice {
    var point: Int = 1
    
    func rollDice() {
        point = Int.random(in: 1...6)
    }
}

class DiceGame {
    
    var numberOfDice: Int {
        dices.count
    }
    
    var dices: [Dice]
    
    init(numberOfDice: Int) {
        dices = [Dice](repeating: Dice(), count: numberOfDice)
    }
    
    public func rollDices() {
        dices.forEach { dice in
            dice.rollDice()
        }
    }
}
