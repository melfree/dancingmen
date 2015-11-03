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
    let title = "Morse Code"
    let size: Float = 30
    
    func transform(textArray: [Character]) -> [Character] {
        return textArray
    }
}
