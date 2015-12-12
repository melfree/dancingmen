//
//  ViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

import Font_Awesome_Swift

class ViewController: UIViewController, UITextViewDelegate, PlaintextMasterDelegate, KeypadMasterDelegate, FontMasterDelegate, GameMasterDelegate {
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var fontTitle: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var plaintext: UIButton!
    @IBOutlet weak var change: UIButton!
    @IBOutlet weak var keypad: UIButton!
    @IBOutlet weak var game: UIButton!
    
    let dataManager = DataManager()
    
    var fontManager = FontManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontManager = dataManager.fontManager
        inputField.becomeFirstResponder()
        inputField.text = fontManager.inputText
        
        setupListeners()
        setupInputOutputStyles()
        setupButtons()
        
        updateTexts()
        updateFonts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // # MARK - Setup events
    
    func setupListeners() {
        // Set keyboard listeners
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        // Set tap gesture listener for dismissing keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)
        
        // Listen for input text changes
        inputField.delegate = self
    }
    
    func setupInputOutputStyles() {
        inputField.layer.cornerRadius = 5.0
        inputField.layer.borderColor = UIColor.grayColor().CGColor
        inputField.layer.borderWidth = 1.0
        inputField.clipsToBounds = true
        
        // Set styles for output text
        outputLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupButtons () {
        reset.setFAIcon(FAType.FATimes, iconSize: 35, forState: .Normal)
        keypad.setFAIcon(FAType.FAKeyboardO, iconSize: 35, forState: .Normal)
        plaintext.setFAIcon(FAType.FAInfoCircle, iconSize: 30, forState: .Normal)
        change.setFAIcon(FAType.FAGear, iconSize: 35, forState: .Normal)
        game.setFAIcon(FAType.FAGamepad, iconSize: 35, forState: .Normal)
    }
    
    // # MARK - Gesture events
    
    func dismissKeyboard() {
        inputField.resignFirstResponder()
    }
    
    // # MARK - Keyboard events
    
    // In info.plist, landscape is disabled for iphone,
    // because the keyboard is too big in landscape mode
    // for the app to be usable.
    func keyboardWillShow(sender: NSNotification) {
        updateHeights(sender)
    }
    
    func keyboardWillHide(sender: NSNotification) {
        bottomLayout.constant = 0
    }
    
    func updateHeights(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                bottomLayout.constant = keyboardHeight
                UIView.animateWithDuration(0.25, animations: { () -> Void in self.view.layoutIfNeeded() })
            }
        }
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
        fontTitle.text = fontManager.currentFont().title + " Cipher"
    }
    
    func updateTexts() {
        let input = inputField.text
        fontManager.inputText = input
        outputLabel.text = outputText()

        // Save changes to input text and font
        dataManager.save()
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
        else if segue.identifier == "gameSegue" {
            let vc: GameViewController = segue.destinationViewController as! GameViewController
            vc.delegate = self
        }
    }
    
    // # Mark - Keypad delegate
    
    func systemFont() -> UIFont {
         return UIFont.systemFontOfSize(40)
    }
    
    func outputText() -> String {
        return fontManager.transformedText()
    }
    
    func inputText() -> String {
        return fontManager.inputText
    }
    
    func currentFontAlphabet() -> String {
        return fontManager.currentAlphabet()
    }
    
    func removeLetter() {
        let input = inputField.text.characters
        let sizeOfInput = input.count
        if sizeOfInput > 0 {
          inputField.text = String(input.dropLast())
          updateTexts()
        }
    }
    
    func addLetter(letter: Character) {
        inputField.text = inputField.text + String(letter)
        updateTexts()
    }
    
    func currentFont() -> UIFont {
        let currentFont = fontManager.currentFont()
        let name = currentFont.name
        let size: CGFloat = CGFloat(currentFont.size)
        return UIFont(name: name, size: size)!
    }
    
    // # Mark - Game delegate
    
    func currentFontLarge() -> UIFont {
        let currentFont = fontManager.currentFont()
        let name = currentFont.name
        let size: CGFloat = CGFloat(currentFont.size * 2)
        return UIFont(name: name, size: size)!
    }
    
    func systemFontLarge() -> UIFont {
        return UIFont.systemFontOfSize(60)
    }
    
    // # Mark - Font delegate
    
    func currentFontFlavorText() -> String {
        return fontManager.currentFont().flavorText
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
        return fontManager.currentFontIndex
    }
}

