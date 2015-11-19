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
        outputLabel.text = delegate.outputText()
    }

    func positionLabel() {
        topConstraint.constant = CGFloat(keypadManager.y(forItem: 0) + keypadManager.height * (Float(buttons.count / keypadManager.numOfButtons) + 1))
    }
    
    func createButtons() {
        let font = delegate.currentFont()
        let alphabet = String(delegate.currentFontAlphabet())
        var i = 0
        
        keypadManager.setNumOfButtonsInRow(frameWidth: Float(self.view.frame.width))
        let h = CGFloat(keypadManager.height)
        let w = CGFloat(keypadManager.width)
        
        for char in alphabet {
            let x = CGFloat(keypadManager.x(forItem: i))
            let y = CGFloat(keypadManager.y(forItem: i))
            let button: UIButton = UIButton(frame: CGRectMake(x, y, h, w))
            
            // Set colors and text
            button.backgroundColor = UIColor.greenColor()
            button.setTitle(String(char), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            
            // Circle edges
            button.layer.cornerRadius = button.bounds.size.width / 2.0
            
            // Highlight when clicked
            button.showsTouchWhenHighlighted = true
            
            // Set font for the title, and force size to decrease if the font is too large
            button.titleLabel!.font = font
            button.titleLabel!.adjustsFontSizeToFitWidth = true
            
            // Add buttonClicked event
            button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
            
            // Add to array so we can toggle the font later
            buttons.append(button)
            
            // Add button to view
            self.view.addSubview(button)
            
            i++
        }
    }
    
    func buttonClicked(sender: UIButton) {
        var input = sender.titleLabel!.text
        delegate.addLetter(Character(input!))
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
    }
    
    @IBAction func didClickBack() {
        goBack()
    }
    
    func goBack() {
      self.dismissViewControllerAnimated(true, completion: nil)
    }

}
