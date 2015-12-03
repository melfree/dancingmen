//
//  Morse.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct Morse: FontProtocol {
    let name = "morse"
    let title = "Morse"
    let size: Float = 40
    let flavorText = "Morse code is a method of transmitting text as a series of on-off tones. Each Morse code symbol represents either a text character or a prosign, and is represented by a unique sequence of dots, and spaces of one dot length. Three dots together form one dash. Letters of a word are separated by three spaces. Words are separated by seven spaces."
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    func transform(textArray: [Character]) -> [Character] {
        return textArray
    }
}
