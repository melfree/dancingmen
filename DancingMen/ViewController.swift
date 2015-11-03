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
    
    @IBOutlet weak var fontPicker: UIPickerView!
        
    var fontManager = FontManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Listen for input text changes
        inputField.delegate = self
        fontPicker.delegate = self
        fontPicker.dataSource = self
        
        changeFont()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // # MARK - Text view
    
    func textViewDidChange(textView: UITextView) {
        outputLabel.text = inputField.text
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
        changeFont()
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontManager.fonts[row].title
    }

    // # MARK - Change font
    func changeFont() {
        var currentFont = fontManager.currentFont
        var name = currentFont.name
        var size: CGFloat = CGFloat(currentFont.size)
        outputLabel.font = UIFont(name: name, size: size)
    }
}

