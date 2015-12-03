//
//  Maritime.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct Maritime: FontProtocol {
    let name = "Maritime Flags"
    let title = "Maritime Flags"
    let size: Float = 40
    let flavorText = "The system of international maritime signal flags is one system of flag signals representing individual letters of the alphabet in signals to or from ships. Each flag spells an alphabetic message, letter by letter. Individual flags also have specific and standard meanings."
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    func transform(textArray: [Character]) -> [Character] {
        return textArray
    }
}