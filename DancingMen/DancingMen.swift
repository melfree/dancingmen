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
    let size: Float = 60
    let flavorText = "In one short story of Sherlock Holmes, 'The Adventure of the Dancing Men,' a man tells Holmes that his wife is recieving strange notes with dancing men on them. The seemingly childish drawings turns out to be a secret code developed and used by Chicago gangsters. Traditionally, spaces are not used; men with a flag denote the last letter of a word."
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    func transform(textArray: [Character]) -> [Character] {
        // DancingMen requires that the last letter of every word is capitalized.
        // Numbers become letters first, though, as in Masonic's transform method.
        var newTextArray = Masonic().transform(textArray)
        var count = newTextArray.count
        var i = 0
        var newArray = [Character]()
        while i < count {
            var oldVal = String(newTextArray[i])
            // Spaces are not kept
            if oldVal != " " {
                if ( (i+1 < count) &&
                    (alphabet.uppercaseString.rangeOfString(String(newTextArray[i+1]).uppercaseString) != nil) )
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