//
//  Braille.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct Braille: FontProtocol {
    let name = "Swell Braille"
    let title = "Braille"
    let size: Float = 40
    let flavorText = "brail"
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    func transform(textArray: [Character]) -> [Character] {
        return textArray
    }
}
