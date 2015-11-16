//
//  FontProtocol.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

protocol FontProtocol {
    // Name is used for the file name of the font, and for equality checking of fonts
    var name: String { get }
    // Title is displayed to user
    var title: String { get }
    var size: Float { get }
    var flavorText: String { get }
    var alphabet: String { get }
    
    // Transforms input into font-compatible input
    func transform(textArray: [Character]) -> [Character]
}
