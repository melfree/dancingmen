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
}

class KeypadViewController: UIViewController {
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var delegate: KeypadMasterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        var normal = UIFont.systemFontOfSize(30)
        var custom = delegate.currentFont()
        var i = 0
        var j = 3
        for char in "abcdefghijklmnopqrstuvwxyz" {
            for font in [normal, custom] {
                i = i%6
                var even = i/2
                
                let x = CGFloat( 50 * (i % 6) + (20 * even) + 5 )
                let y = CGFloat( (j/3) * 55)
                let width = CGFloat( 45 + 10 * (i%2) )
                let height = CGFloat( 45 )
                let button :UIButton = UIButton(frame: CGRectMake(x, y, width, height))
                button.backgroundColor = UIColor.greenColor()
                button.setTitle(String(char), forState: UIControlState.Normal)
                button.showsTouchWhenHighlighted = true
                button.titleLabel!.font = font
                button.titleLabel!.adjustsFontSizeToFitWidth = true
                button.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
                self.view.addSubview(button)
            
                i++
            }
            j++
        }
    }
    
    func buttonClicked(sender: UIButton) {
        var input = sender.titleLabel!.text
        delegate.addLetter(Character(input!))
    }
    
    @IBAction func didClickBack() {
        goBack()
    }
    
    func goBack() {
      self.dismissViewControllerAnimated(true, completion: nil)
    }

}
