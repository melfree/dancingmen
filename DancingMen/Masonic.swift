//
//  Masonic.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct Masonic: FontProtocol {
    let name = "Masonic Cipher"
    let title = "Masonic"
    let size: Float = 30
    let flavorText = "mas"
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func transform(textArray: [Character]) -> [Character] {
        // Masonic requires that numbers become letters.
        return map(textArray) { char in
            var k = String(char)
            for i in 0...9
            {
                if String(i) == k {
                    return Character(UnicodeScalar(48 + i + 17))
                }
            }
            return char
        }
    }
}