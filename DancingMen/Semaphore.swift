//
//  Semaphore.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct Semaphore: FontProtocol {
    let name = "Semaphore"
    let title = "Semaphore"
    let size: Float = 40
    let flavorText = "sema"
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    func transform(textArray: [Character]) -> [Character] {
        // All characters in Semaphore are lowercase.
        return map(textArray) { Character(String($0).lowercaseString) }
    }
}
