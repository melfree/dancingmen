//
//  FontProtocol.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

protocol FontProtocol {
    var name: String { get }
    var title: String { get }
    var size: Float { get }
    var flavorText: String { get }
    var alphabet: String { get }
    
    // Transforms input into font-compatible input
    func transform(textArray: [Character]) -> [Character]
}
