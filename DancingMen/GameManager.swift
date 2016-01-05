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
    var alphabetSize = 0
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
    
    // There is a bug in XCode buttons that requires
    // the first round starts with isSystemFont = true.
    // The button UiLabel gets clipped on the custom font later on,
    // iff it is initialized with the system font.
    mutating func startFirstRound() {
        alphabetSize = alphabetArray.count
        
        shuffleAlphabet()
    }
    
    mutating func startNewRound() {
        shuffleAlphabet()
        
        isSystemFont = (Int(arc4random_uniform(UInt32(1)+1)) == 1)
    }
    
    mutating func shuffleAlphabet() {
      answerIndex = Int(arc4random_uniform(UInt32(2)+1))
      for i in 0..<(alphabetSize - 1) {
        let j = Int(arc4random_uniform(UInt32(alphabetSize - i))) + i
        if (i != j) {swap(&alphabetArray[i], &alphabetArray[j])}
      }
    }
}
