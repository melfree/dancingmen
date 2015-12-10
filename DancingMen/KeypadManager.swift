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
    var width: Float = 65.0
    var height: Float = 65.0
    let topPadding: Float = 25.0
    var containerWidth: Float = 70.0
    var containerHeight: Float = 70.0
    
    let minimizer: Float = 0.8
    
    // We will need to keep track of the number of buttons that can fit in a row, 
    // given the current window frame's width.
    var numOfButtons: Int = 0
    var centeringPadding: Float = 0
    
    func x(forItem i: Int) -> Float {
        return centeringPadding + (containerWidth * Float(i % numOfButtons) )
    }
    
    func y(forItem i: Int) -> Float {
        return containerWidth - width + topPadding + (containerHeight * Float(i / numOfButtons) )
    }
    
    // For larger alphabets needing smaller keyboards
    mutating func minimize() {
        containerWidth = containerWidth * minimizer
        containerHeight = containerHeight * minimizer
        width = width * minimizer
        height = height * minimizer
    }
    
    mutating func setNumOfButtonsInRow(frameWidth frameWidth: Float) {
        centeringPadding = (frameWidth % containerWidth) / 2.0
        numOfButtons = Int(frameWidth/containerWidth)
    }
}
