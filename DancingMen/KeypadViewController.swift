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
    func addLetter(letter: Character)
    func currentFontAlphabet() -> String
}

class KeypadViewController: UIViewController {
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var delegate: KeypadMasterDelegate!
    var buttons: [UIButton] = []
    var isPlaintext: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        isPlaintext = false
        buttons = []
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        let font = delegate.currentFont()
        let alphabet = String(delegate.currentFontAlphabet())
        var i = 0
        for char in alphabet {
                let x = CGFloat( 60 * (i % 6) )
                let y = CGFloat( 60 * (i / 6) )
                let button :UIButton = UIButton(frame: CGRectMake(x, y, 55, 55))
            
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
    }
    
    // # Mark - IB actions
    
    @IBAction func didClickToggle() {
        isPlaintext = !isPlaintext
        var font = UIFont.systemFontOfSize(30)
        if !(isPlaintext) {
            font = delegate.currentFont()
        }
        buttons.map {$0.titleLabel!.font = font }
    }
    
    @IBAction func didClickBack() {
        goBack()
    }
    
    func goBack() {
      self.dismissViewControllerAnimated(true, completion: nil)
    }

}
