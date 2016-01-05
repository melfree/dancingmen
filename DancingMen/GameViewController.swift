//
//  GameViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 12/2/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

protocol GameMasterDelegate {
    func currentFontLarge() -> UIFont
    func systemFontLarge() -> UIFont
    func currentFontAlphabet() -> String
}

class GameViewController: UIViewController {
    var delegate: GameMasterDelegate!
    
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
    var game = GameManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bottomLayout.constant = view.bounds.size.height / 2 - 100
        
        setupButtons()
        setupLabel()
        
        game.alphabetArray = Array(delegate.currentFontAlphabet().characters)
        game.startFirstRound()
        updateOutlets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Setup
    
    func setupLabel() {
        outputLabel.adjustsFontSizeToFitWidth = true
        outputLabel.numberOfLines = 1
        outputLabel.lineBreakMode = NSLineBreakMode.ByClipping
    }
    
    func setupButtons() {
        for button in [optionOne,optionTwo,optionThree] {
            button.titleLabel!.adjustsFontSizeToFitWidth = true
            button.layer.cornerRadius = button.bounds.size.width / 2.0 - 10
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        }
    }
    
    // # MARK - IB actions
    
    @IBAction func didClickBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func submitAnswer(sender: UIButton!) {
        if (game.isAnswer(sender.titleLabel!.text!)) {
            respondToCorrectAnswer()
        } else {
            respondToIncorrectAnswer()
        }
    }
    
    // # MARK - Game functions
    
    func enableGame() {
        for button in [optionOne,optionTwo,optionThree] {
            button.enabled = true
        }
    }
    
    func disableGame() {
        for button in [optionOne,optionTwo,optionThree] {
            button.enabled = false
        }
    }
    
    func respondToIncorrectAnswer() {
        self.view.backgroundColor = UIColor(red:1.0,green:0.7,blue:0.7,alpha: 1.0)
        UIView.animateWithDuration(0.3, animations:{
            self.view.backgroundColor = UIColor.whiteColor()
            })
    }
    
    func respondToCorrectAnswer () {
        disableGame()
        self.view.backgroundColor = UIColor(red:0.7,green:1.0,blue:0.7,alpha: 1.0)
        UIView.animateWithDuration(0.4, animations:{
            self.view.backgroundColor = UIColor.whiteColor()
            }, completion: {action in
                self.resetGame()
        } )
    }
    
    func resetGame() {
        let width = self.outputLabel.frame.size.width
        let height = self.outputLabel.frame.size.height
        let x = self.outputLabel.frame.origin.x
        let y = self.outputLabel.frame.origin.y
        
        let maximum = max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        
        UIView.animateWithDuration(0.3, animations:{
            self.outputLabel.frame = CGRectMake(x - maximum, y, width, height)
            }, completion: {
                action in
                self.outputLabel.frame = CGRectMake(x + (2*maximum),y,width,height)
                UIView.animateWithDuration(0.3, animations:{
                    self.game.startNewRound()
                    self.updateOutlets()
                    self.outputLabel.frame = CGRectMake(x, y, width, height)})
                    self.enableGame()
        })
    }
    
    func updateOutlets() {
        var optionFont = delegate.systemFontLarge()
        var labelFont = delegate.currentFontLarge()
        if game.isSystemFont {
            optionFont = delegate.currentFontLarge()
            labelFont = delegate.systemFontLarge()
        }
        var index = 0
        for button in [optionOne,optionTwo,optionThree] {
            button.alpha = 0
            button.titleLabel!.font = optionFont
            button.setTitle(game.answerString(index),forState: UIControlState.Normal)
            index += 1
            button.alpha = 1
        }
        
        outputLabel.font = labelFont
        outputLabel.text = game.answerString()
    }

}
