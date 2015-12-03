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
    let size: Float = 40
    let flavorText = "The Masonic cipher (alternatively, the pigpen cipher or Freemason's cipher) is a geometric simple substitution cipher, which exchanges letters for symbols which are fragments of a grid. Records of this system have been found which go back to at least the 18th century. In the Masonic cipher, number digits are replaced with letters."
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    func transform(textArray: [Character]) -> [Character] {
        // Masonic requires that numbers become letters.
        return map(textArray) { char in
            var k = String(char)
            for i in 0...9
            {
                if String(i) == k {
                    if "0" == k {
                      return Character("J")
                    }
                    else {
                      return Character(UnicodeScalar(47 + i + 17))
                    }
                }
            }
            return char
        }
    }
}