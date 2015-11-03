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
    
    var currentFont: FontProtocol;
    
    init() {
        currentFont = fonts[0]
    }
    
    mutating func selectFont(index: Int) {
        currentFont = fonts[index]
    }
    
    func transform(text: String) -> (String) {
        // Transform text into array
        let textArray = Array(text)
    
        // Map each value in the array to a new value, as determined by a function
        // passed in from the currentFont struct
        let mappedArray = currentFont.transform(textArray)
    
        // Return the new string
        let transformedText = String(mappedArray)
    
        return transformedText
    }
}