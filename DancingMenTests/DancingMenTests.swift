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
        
        describe("fonts") {
            // There are 6 font structures.
            var dancingMen = DancingMen()
            var morse = Morse()
            var braille = Braille()
            var masonic = Masonic()
            var semaphore = Semaphore()
            var maritime = Maritime()
            
            // Fonts should have a unique font name (tested by FontManager test).
            // They also have a conversioin method (also tested by FontManager tests)
            // They should also have a display Title, descriptive flavorText, and an alphabet;
            // this is guaranteed by the non-optional String types of these attributes,
            // since they all conform to the FontProtocol.
        }
        
        describe("fontManager") {
            var fontManager = FontManager()
            let test_string = "TEST string 1230"
            let test_semaphore = "test string 1230"
            let test_dancing_men = "tesTstrinG1230"
            let test_masonic = "TEST string ABCJ"
            
            describe("fonts") {
                it("holds 6 fonts") {
                    expect(fontManager.fonts.count).to(equal(6))
                }
                it("has only unique fonts") {
                    var fontNamesSoFar: [String] = []
                    expect(fontManager.fonts.reduce(fontNamesSoFar, combine: {a,b in
                        if (contains(a,b.name)) {
                            return a
                        }
                        else {
                            return a + [b.name]
                        }
                            }).count
                        ).to(equal(6))
                }
            }
            describe("inputText") {
                it("has blank initial inputText") {
                    expect(fontManager.inputText).to(equal(""))
                }
                it("has simple inputText getter/setters") {
                    fontManager.inputText = test_string
                    expect(fontManager.inputText).to(equal(test_string))
                }
            }
            describe("inputText") {
                it("has simple inputText getter/setters") {
                    fontManager.inputText = test_string
                    expect(fontManager.inputText).to(equal(test_string))
                }
            }
            describe("currentFont") {
                it("starts with the first font") {
                    expect(fontManager.fonts[0].name).to(equal(fontManager.currentFont.name))
                }
            }
            describe("selectFont(int)") {
                it("changes currentFont when a different font is selected") {
                    fontManager.selectFont(1)
                    expect(fontManager.fonts[1].name).to(equal(fontManager.currentFont.name))
                    fontManager.selectFont(0)
                    expect(fontManager.fonts[0].name).to(equal(fontManager.currentFont.name))
                }
            }
            describe("currentIndex()") {
                it("gets the current index value of the font") {
                    expect(fontManager.currentIndex()).to(equal(0))
                    fontManager.selectFont(1)
                    expect(fontManager.currentIndex()).to(equal(1))
                    fontManager.selectFont(0)
                }
            }
            describe("currentAlphabet") {
                it("gets the current alphabet of keypad letters for the given font") {
                    expect(fontManager.currentAlphabet()).to(equal(fontManager.currentFont.alphabet))
                    fontManager.selectFont(1)
                    expect(fontManager.currentAlphabet()).to(equal(fontManager.currentFont.alphabet))
                    fontManager.selectFont(0)
                }
            }
            describe("transformedText") {
                // Only Semaphore (0), DancingMen (1), and Masonic (2) and have extra requirements
                it ("alters input strings to fit the requirements of the current font") {
                    fontManager.inputText = test_string
                    expect(fontManager.currentFont.name).to(equal("Semaphore"))
                    expect(fontManager.transformedText()).to(equal(test_semaphore))
                    fontManager.selectFont(1)
                    expect(fontManager.currentFont.name).to(equal("GL-DancingMen"))
                    expect(fontManager.transformedText()).to(equal(test_dancing_men))
                    fontManager.selectFont(2)
                    expect(fontManager.currentFont.name).to(equal("Masonic Cipher"))
                    expect(fontManager.transformedText()).to(equal(test_masonic))
                    fontManager.selectFont(3)
                    expect(fontManager.transformedText()).to(equal(test_string))
                    fontManager.selectFont(4)
                    expect(fontManager.transformedText()).to(equal(test_string))
                    fontManager.selectFont(5)
                    expect(fontManager.transformedText()).to(equal(test_string))

                }
            }
        }
        
        describe ("keypadManager") {
            var keypadManager = KeypadManager()
            let delta = 0.5
            let numButtonsInRow = 8
            
            describe("width, height, margin, topPadding, containerWidth, containerHeight") {
                it("has proper values set for the dimensions of the keypad buttons") {
                    expect(keypadManager.width).to(beCloseTo(55, within: delta))
                    expect(keypadManager.height).to(beCloseTo(55, within: delta))
                    expect(keypadManager.topPadding).to(beCloseTo(25, within: delta))
                    expect(keypadManager.containerWidth).to(beCloseTo(60, within: delta))
                    expect(keypadManager.containerHeight).to(beCloseTo(60, within: delta))
                    expect(keypadManager.numOfButtons).to(beCloseTo(0, within: delta))
                }
                
                it("has function to change the number of buttons that should be in a row, given the device's screen width"){
                    keypadManager.setNumOfButtonsInRow(frameWidth: 500)
                    expect(keypadManager.numOfButtons).to(beCloseTo(numButtonsInRow, within: delta))
                }
            
                it("has different x positions of two nearby buttons"){
                    let expected = keypadManager.x(forItem: 1)
                    expect(keypadManager.x(forItem: 0)).toNot(beCloseTo(expected, within: delta))
                    
                }
                it("has same x positions of two buttons one row apart"){
                    let expected = keypadManager.x(forItem: numButtonsInRow)
                    expect(keypadManager.x(forItem: 0)).to(beCloseTo(expected, within: delta))
                    
                }
                it("has the same y positions of two nearby buttons"){
                    let expected = keypadManager.y(forItem: 1)
                    expect(keypadManager.y(forItem: 0)).to(beCloseTo(expected, within: delta))
                    
                }
                it("has different y positions of two buttons one row apart"){
                    let expected = keypadManager.y(forItem: numButtonsInRow)
                    expect(keypadManager.y(forItem: 0)).toNot(beCloseTo(expected, within: delta))
                    
                }
            }
        }
        
        
    }
}