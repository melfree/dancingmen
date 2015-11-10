//
//  ViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var plaintextButton: UIButton!
    @IBOutlet weak var fontPicker: UIPickerView!
        
    var fontManager = FontManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set styles for input field
        inputField.layer.cornerRadius = 5.0
        inputField.layer.borderColor = UIColor.grayColor().CGColor
        inputField.layer.borderWidth = 1.0
        inputField.clipsToBounds = true
        
        // Listen for input text changes
        inputField.delegate = self
        fontPicker.delegate = self
        fontPicker.dataSource = self
        
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
    
    @IBAction func didClickTogglePlaintext() {
        //If Plaintext, show the output and set system font.
        // If not Plaintext, hide the output and set chosen font.
        fontManager.togglePlaintext()
        updateFonts()
        updateTexts()
    }
    
    // # MARK - Text view
    
    func textViewDidChange(textView: UITextView) {
        updateTexts()
    }
    
    // # MARK - Picker view
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontManager.fonts.count
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fontManager.selectFont(row)
        updateFonts()
        updateTexts()
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontManager.fonts[row].title
    }

    // # MARK - Change font
    
    func updateFonts() {
        // Update outputLabel and inputField
        var currentFont = fontManager.currentFont
        var name = currentFont.name
        var size: CGFloat = CGFloat(currentFont.size)
        var font = UIFont(name: name, size: size)
        outputLabel.font = font
        if fontManager.isPlaintext {
            inputField.font = UIFont.systemFontOfSize(30)
            outputLabel.hidden = false
        } else {
            inputField.font = font
            outputLabel.hidden = true
        }
    }
    
    func updateTexts() {
        var input = inputField.text
        fontManager.inputText = input
        var output = fontManager.transformedText()
        outputLabel.text = output
        if !fontManager.isPlaintext {
          inputField.text = output
        } else {
          inputField.text = input
        }
    }
}

