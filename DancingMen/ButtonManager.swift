//
//  ButtonManager.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/12/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct ButtonManager {
    // Define unchanging values used for dimensions of keypad buttons.
    static var width: Float = 55.0
    static var height: Float = 55.0
    static var margin: Float = 5.0
    static var topPadding: Float = 25.0
    static var containerWidth: Float = 60.0
    static var containerHeight: Float = 60.0
    
    // We will need to keep track of the number of buttons that can fit in a row, 
    // given the current window frame's width.
    static var numOfButtons: Float = 0.0
    
    static func x(forItem i: Int) -> Float {
        return margin + (containerWidth * Float(i % Int(numOfButtons)) )
    }
    
    static func y(forItem i: Int) -> Float {
        return margin + topPadding + (containerHeight * Float(i / Int(numOfButtons)) )
    }
    
    static func setNumOfButtonsInRow(#frameWidth: Float) {
        numOfButtons = frameWidth/containerWidth
    }
}
