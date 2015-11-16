//
//  DancingMen.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct DancingMen: FontProtocol {
    let name = "GL-DancingMen"
    let title = "Dancing Men"
    let size: Float = 50
    let flavorText = "In one short story of Sherlock Holmes, 'The Adventure of the Dancing Men,' a man tells Holmes that his wife is recieving strange notes with dancing men on them. The seemingly childish drawings turns out to be a secret code developed and used by Chicago gangsters. Traditionally, spaces are not used; men with a flag denote the last letter of a word."
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func transform(textArray: [Character]) -> [Character] {
        // DancingMen requires that the last letter of every word is capitalized.
        // No other letter may be capitalized.
        var count = textArray.count
        var i = 0
        var newArray = [Character]()
        while i < count {
            var oldVal = String(textArray[i])
            // Spaces are not kept
            if oldVal != " " {
                if ( (i+1 < count) &&
                    (alphabet.rangeOfString(String(textArray[i+1]).uppercaseString) != nil) )
                {
                    // Any letter which precedes another letter is lowercase
                    oldVal = oldVal.lowercaseString
                } else {
                    // All other letters are uppercase
                    oldVal = oldVal.uppercaseString
                }
                newArray.append(Character(oldVal))
            }
            i++
        }
        return newArray
    }
}