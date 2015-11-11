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
    let size: Float = 30
    let flavorText = "Mari"
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    func transform(textArray: [Character]) -> [Character] {
        return textArray
    }
}