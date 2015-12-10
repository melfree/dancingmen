//
//  FontManager.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

class FontManager: NSObject, NSCoding {
    let fonts: [FontProtocol] = [Semaphore(), DancingMen(), Masonic(), Morse(), Maritime(), Braille()]
    var currentFontIndex: Int = 0
    var inputText: String = ""
    
    override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        self.inputText = aDecoder.decodeObjectForKey("inputText") as! String
        self.currentFontIndex = aDecoder.decodeObjectForKey("currentFontIndex") as! Int
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(inputText, forKey: "inputText")
        aCoder.encodeObject(currentFontIndex, forKey: "currentFontIndex")
    }
    
    func selectFont(index: Int) {
        currentFontIndex = index
    }
    
    func currentFont() -> FontProtocol {
        return fonts[currentFontIndex]
    }
    
    func currentAlphabet() -> String {
        return currentFont().alphabet
    }
    
    func transformedText() -> (String) {
        let font = currentFont()
        
        // Transform text into array
        let textArray = Array(inputText.characters)
        // Map each value in the array to a new value, as determined by a function
        // passed in from the currentFont struct
        let mappedArray = font.transform(textArray)
        // Return the new string
        let transformedText = String(mappedArray)
    
        return transformedText
    }
}