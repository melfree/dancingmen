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
    let flavorText = "In Flag Semaphore, information is encoded by the position of the visual signal. It is read when the signal (flag) is in a fixed position. Semaphores were adopted and widely used in the maritime world in the 19th century. It is still acceptable for emergency communication. All Semaphore letters are lowercase."
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    func transform(textArray: [Character]) -> [Character] {
        // All characters in Semaphore are lowercase.
        return map(textArray) { Character(String($0).lowercaseString) }
    }
}
