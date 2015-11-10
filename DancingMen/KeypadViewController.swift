//
//  KeypadViewController.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/10/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import UIKit

class KeypadViewController: UIViewController {
    
    @IBOutlet var letterButtons: [UIButton]!
    
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
        var custom = UIFont.systemFontOfSize(30)
        var i = 0
        var j = 3
        for char in "abcdefghijklmnopqrstuvwxyz" {
            for font in [normal,custom] {
                let x = CGFloat( 60 * (i % 6) + (20 * ((1+i) % 2)))
                //+ self.view.frame.origin.x
                let y = CGFloat( (j/3) * 50)
                let button :UIButton = UIButton(frame: CGRectMake(x, y, 45, 45))
                button.backgroundColor = UIColor.greenColor()
                button.setTitle(String(char), forState: UIControlState.Normal)
                button.titleLabel!.font = font
                self.view.addSubview(button)
                i++
            }
            j++
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func didClickBack() {
      self.dismissViewControllerAnimated(true, completion: nil)
    }

}
