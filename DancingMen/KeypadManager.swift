//
//  ButtonManager.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/12/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct KeypadManager {
    // Define unchanging values used for dimensions of keypad buttons.
    var width: Float = 55.0
    var height: Float = 55.0
    var margin: Float = 5.0
    var topPadding: Float = 25.0
    var containerWidth: Float = 60.0
    var containerHeight: Float = 60.0
    
    // We will need to keep track of the number of buttons that can fit in a row, 
    // given the current window frame's width.
    var numOfButtons: Float = 0.0
    
    func x(forItem i: Int) -> Float {
        return margin + (containerWidth * Float(i % Int(numOfButtons)) )
    }
    
    func y(forItem i: Int) -> Float {
        return margin + topPadding + (containerHeight * Float(i / Int(numOfButtons)) )
    }
    
    mutating func setNumOfButtonsInRow(#frameWidth: Float) {
        numOfButtons = frameWidth/containerWidth
    }
}
