//
//  ViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

import Font_Awesome_Swift

class ViewController: UIViewController, UITextViewDelegate, PlaintextMasterDelegate, KeypadMasterDelegate, FontMasterDelegate {
    
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var fontTitle: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var plaintext: UIButton!
    @IBOutlet weak var change: UIButton!
    @IBOutlet weak var keypad: UIButton!
        
    var fontManager = FontManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set styles for input field
        inputField.layer.cornerRadius = 5.0
        inputField.layer.borderColor = UIColor.grayColor().CGColor
        inputField.layer.borderWidth = 1.0
        inputField.clipsToBounds = true
        
        // Set styles for output text
        outputLabel.adjustsFontSizeToFitWidth = true
        
        // Listen for input text changes
        inputField.delegate = self
        
        // Styles for buttons
        reset.setFAIcon(FAType.FAEraser, iconSize: 35, forState: .Normal)
        keypad.setFAIcon(FAType.FAKeyboardO, iconSize: 35, forState: .Normal)
        plaintext.setFAIcon(FAType.FAFileTextO, iconSize: 35, forState: .Normal)
        change.setFAIcon(FAType.FAGear, iconSize: 35, forState: .Normal)
        
        // Make sure font and output text are set
        updateTexts()
        updateFonts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // # MARK - IB actions
    
    @IBAction func didClickReset() {
        inputField.text = ""
        updateTexts()
    }
    
    // # MARK - Text view
    
    func textViewDidChange(textView: UITextView) {
        updateTexts()
    }

    // # MARK - Change font
    
    func updateFonts() {
        // Update outputLabel
        outputLabel.font = currentFont()
        fontTitle.text = fontManager.currentFont.title + " Cipher"
    }
    
    func updateTexts() {
        var input = inputField.text
        fontManager.inputText = input
        outputLabel.text = outputText()
    }
    
    // # MARK - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "keypadSegue" {
            let vc: KeypadViewController = segue.destinationViewController as! KeypadViewController
            vc.delegate = self
        }
        else if segue.identifier == "plaintextSegue" {
            let vc: PlaintextViewController = segue.destinationViewController as! PlaintextViewController
            vc.delegate = self
        }
        else if segue.identifier == "fontSegue" {
            let vc: FontViewController = segue.destinationViewController as! FontViewController
            vc.delegate = self
        }
    }
    
    // # Mark - Keypad delegate
    
    func systemFont() -> UIFont {
         return UIFont.systemFontOfSize(30)
    }
    
    func outputText() -> String {
        return fontManager.transformedText()
    }
    
    func currentFontAlphabet() -> String {
        return fontManager.currentAlphabet()
    }
    
    func addLetter(letter: Character) {
        inputField.text = inputField.text + String(letter)
        updateTexts()
    }
    
    func currentFont() -> UIFont {
        var currentFont = fontManager.currentFont
        var name = currentFont.name
        var size: CGFloat = CGFloat(currentFont.size)
        
        return UIFont(name: name, size: size)!
    }
    
    // # Mark - Font delegate
    
    func currentFontFlavorText() -> String {
        return fontManager.currentFont.flavorText
    }
    
    func numberOfFonts() -> Int {
        return fontManager.fonts.count
    }
    
    func selectFont(row: Int) {
        fontManager.selectFont(row)
        updateFonts()
        updateTexts()
    }
    
    func fontTitle(row: Int) -> String {
        return fontManager.fonts[row].title
    }
    
    func currentFontIndex() -> Int {
        return fontManager.currentIndex()
    }
}

