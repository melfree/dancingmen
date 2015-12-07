//
//  KeypadViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/10/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

protocol KeypadMasterDelegate {
    func currentFont() -> UIFont
    func systemFont() -> UIFont
    func addLetter(letter: Character)
    func currentFontAlphabet() -> String
    func outputText() -> String
    func inputText() -> String
    func removeLetter()
}

class KeypadViewController: UIViewController {
    
    var delegate: KeypadMasterDelegate!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var buttons: [UIButton] = []
    var isPlaintext: Bool = false
    
    var keypadManager = KeypadManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style outputLabel
        outputLabel.textColor = UIColor.blackColor()
        outputLabel.numberOfLines = 0
        outputLabel.font = delegate.currentFont()
        outputLabel.adjustsFontSizeToFitWidth = true
        
        // Do any additional setup after loading the view.
        isPlaintext = false
        createButtons()
        positionLabel()
        updateText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // # Mark - Gesture functions
    
    // Prevent rotation errors on the buttons on this view
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        //super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
        updateButtons()
    }
    
    func updateButtons(){
        keypadManager.setNumOfButtonsInRow(frameWidth: Float(self.view.frame.width))
        let h = CGFloat(keypadManager.height)
        let w = CGFloat(keypadManager.width)
        
        for i in 0..<buttons.count {
            let x = CGFloat(keypadManager.x(forItem: i))
            let y = CGFloat(keypadManager.y(forItem: i))
            buttons[i].frame = CGRectMake(x, y, h, w)
        }
    }
    
    // # Mark -Setup functions
    
    func updateText() {
        if isPlaintext {
            outputLabel.text = delegate.inputText()
        } else {
            outputLabel.text = delegate.outputText()
        }
    }

    func positionLabel() {
        topConstraint.constant = CGFloat(keypadManager.y(forItem: 0) + keypadManager.height * (Float(buttons.count / keypadManager.numOfButtons) + 1) + 5)
    }
    
    func createButtons() {
        let font = delegate.currentFont()
        let alphabet = String(delegate.currentFontAlphabet()) + "  "
        var lengthOfAlphabet = count(delegate.currentFontAlphabet()) + 2
        var i = 0
        
        if lengthOfAlphabet > 30 { keypadManager.minimize() }
        let screenHeight = UIScreen.mainScreen().bounds.height
        if screenHeight < 660
          {  keypadManager.minimize() }
        
        keypadManager.setNumOfButtonsInRow(frameWidth: Float(self.view.frame.width))
        let h = CGFloat(keypadManager.height)
        let w = CGFloat(keypadManager.width)
        
        for char in alphabet {
            let x = CGFloat(keypadManager.x(forItem: i))
            let y = CGFloat(keypadManager.y(forItem: i))
            let button: UIButton = UIButton(frame: CGRectMake(x, y, h, w))
            button.setTitle(String(char), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            // Circle edges, highlight when clicked
            button.layer.cornerRadius = button.bounds.size.width / 2.0
            button.showsTouchWhenHighlighted = true
            button.titleLabel!.adjustsFontSizeToFitWidth = true
            
            // Set colors and text
            if (lengthOfAlphabet > i + 1) {
                if (lengthOfAlphabet > i + 2) {
                    button.backgroundColor = UIColor.greenColor()
                } else {
                    // space button
                    button.backgroundColor = UIColor(red:0.4,green:0.8,blue:0.4,alpha: 1.0)
                }
                button.titleLabel!.font = font
                
                // Add buttonClicked event
                button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
                
                // Add to array so we can toggle the font later
                buttons.append(button)
            } else {
                button.backgroundColor = UIColor(red:0.8,green:0.4,blue:0.4,alpha: 1.0)
                button.addTarget(self, action: "backspaceClicked:", forControlEvents: .TouchUpInside)
            }
            self.view.addSubview(button)
            
            i++
        }
    }
    
    func buttonClicked(sender: UIButton) {
        var input = sender.titleLabel!.text
        delegate.addLetter(Character(input!))
        updateText()
    }
    
    func backspaceClicked(sender: UIButton) {
        delegate.removeLetter()
        updateText()
    }
    
    // # Mark - IB actions
    
    @IBAction func didClickToggle() {
        isPlaintext = !isPlaintext
        var font = delegate.systemFont()
        if !(isPlaintext) {
            font = delegate.currentFont()
        }
        buttons.map {$0.titleLabel!.font = font }
        outputLabel.font = font
        updateText()
    }
    
    @IBAction func didClickBack() {
        goBack()
    }
    
    func goBack() {
      self.dismissViewControllerAnimated(true, completion: nil)
    }

}
