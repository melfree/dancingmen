//
//  GameManager.swift
//  DancingMen
//
//  Created by Melanie Freeman on 12/2/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct GameManager {
    // Define unchanging values used for dimensions of keypad buttons.
    var alphabetArray: [Character] = []
    var answerIndex = 0
    var isSystemFont = true
    
    func isAnswer(guess: String) -> Bool {
        let answer = answerString()
        return (guess.uppercaseString) == (answer.uppercaseString)
    }
    
    func answerString() -> String {
        let answer = String(alphabetArray[answerIndex])
        if !(isSystemFont) {
            return answer
        } else {
            return answer.uppercaseString
        }
    }
    
    func answerString(index: Int) -> String {
        let answer = String(alphabetArray[index])
        if isSystemFont {
            return answer
        } else {
            return answer.uppercaseString
        }
    }
    
    mutating func startNewRound() {
        answerIndex = Int(arc4random_uniform(UInt32(2)+1))
        isSystemFont = (Int(arc4random_uniform(UInt32(1)+1)) == 1)
        let c = alphabetArray.count
        for i in 0..<(c - 1) {
            let j = Int(arc4random_uniform(UInt32(c - i))) + i
            swap(&alphabetArray[i], &alphabetArray[j])
        }
    }
}
