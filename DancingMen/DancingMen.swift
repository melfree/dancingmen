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
    let flavorText = "danc"
    
    func transform(textArray: [Character]) -> [Character] {
        // DancingMen requires that the last letter of every sentence is capitalized.
        // No other letter may be capitalized.
        var count = textArray.count
        var i = 0
        var newArray = [Character]()
        while i < count {
            var oldVal = String(textArray[i])
            // Periods are not kept
            if oldVal != "." {
                if i+1 < count && textArray[i+1] == "." {
                    // Any letter which is followed by a period must be uppercase
                    oldVal = oldVal.uppercaseString
                } else {
                    // Any letter which is not followed by a period must be lowercase
                    oldVal = oldVal.lowercaseString
                }
                newArray.append(Character(oldVal))
            }
            i++
        }
        return newArray
    }
}