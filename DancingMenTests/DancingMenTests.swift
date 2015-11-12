//
//  DancingMenTests.swift
//  DancingMenTests
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Quick
import Nimble
import DancingMen

class DancingMenSpec: QuickSpec {
    override func spec(){
        
        describe("fontManager") {
            var fontManager = FontManager()
        }
    }
}
//            describe("start new round function") {
//                game.startNewRound()
//                it("resets key variables"){
//                    expect(game.currentValue).to(equal(50))
//                    expect(game.round).to(equal(1))
//                }
//                it("has a target value in proper range"){
//                    expect(game.targetValue).to(beGreaterThanOrEqualTo(1))
//                    expect(game.targetValue).to(beLessThanOrEqualTo(100))
//                }
//            }