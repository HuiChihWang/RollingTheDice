//
//  DiceGame.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/11.
//

import Foundation

struct Dice {
    var point: Int = 1
    
    mutating func rollDice() {
        point = Int.random(in: 1...6)
    }
}

class DiceGame {
    
    var numberOfDice: Int {
        dices.count
    }
    
    var dicesNumber: [Int] {
        dices.map { $0.point }
    }
    
    private var dices: [Dice]
    
    init(numberOfDice: Int) {
        dices = [Dice](repeating: Dice(), count: numberOfDice)
    }
    
    public func rollDices() {
        dices.indices.forEach { index in
            dices[index].rollDice()
        }
    }
}
