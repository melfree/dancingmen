//
//  FontManager.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct FontManager {
    let fonts: [FontProtocol] = [Semaphore(), DancingMen(), Morse(), Maritime(), Masonic(), Braille()]
    
    var currentFont: FontProtocol
    var inputText: String
    
    init() {
        inputText = ""
        currentFont = fonts[0]
    }
    
    mutating func selectFont(index: Int) {
        currentFont = fonts[index]
    }
    
    func currentIndex () -> Int {
        for i in 0..<fonts.count {
            if currentFont.name == fonts[i].name {
                return i
            }
        }
        return 0
    }
    
    func currentAlphabet() -> String {
        return currentFont.alphabet
    }
    
    func transformedText() -> (String) {
        // Transform text into array
        let textArray = Array(inputText)
    
        // Map each value in the array to a new value, as determined by a function
        // passed in from the currentFont struct
        let mappedArray = currentFont.transform(textArray)
    
        // Return the new string
        let transformedText = String(mappedArray)
    
        return transformedText
    }
}