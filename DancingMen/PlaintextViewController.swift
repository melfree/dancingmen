//
//  PlaintextViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/12/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

protocol PlaintextMasterDelegate {
    func currentFont() -> UIFont
    func outputText() -> String
}

class PlaintextViewController: UIViewController {

    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    
    var delegate: PlaintextMasterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        outputLabel.text = delegate.outputText()
        outputLabel.font = delegate.currentFont()
        outputLabel.adjustsFontSizeToFitWidth = true
        outputLabel.numberOfLines = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // # MARK - IB actions
    
    @IBAction func didClickBack() {
        goBack()
    }
    
    func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
