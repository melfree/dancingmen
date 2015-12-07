//
//  FontViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/10/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

protocol FontMasterDelegate {
    func selectFont(row: Int)
    func fontTitle(row: Int) -> String
    func currentFontFlavorText() -> String
    func currentFontIndex() -> Int
    func numberOfFonts() -> Int
}

class FontViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var fontPicker: UIPickerView!
    @IBOutlet weak var fontLabel: UILabel!
    
    var delegate: FontMasterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontPicker.delegate = self
        fontPicker.dataSource = self
        fontPicker.selectRow(delegate.currentFontIndex(), inComponent: 0, animated: false)
        
        fontLabel.adjustsFontSizeToFitWidth = true
        
        updateFont()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // # Mark - Font label
    
    func updateFont() {
        var row = fontPicker.selectedRowInComponent(0)
        delegate.selectFont(row)
        fontLabel.text = delegate.currentFontFlavorText()
    }
    
    // # MARK - Picker view
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return delegate.numberOfFonts()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateFont()
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return delegate.fontTitle(row)
    }
    
    // # MARK - IB actions
    
    @IBAction func didClickBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
