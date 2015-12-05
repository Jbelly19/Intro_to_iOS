//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Josh Belmont on 12/3/15.
//  Copyright © 2015 Belmont. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let index = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
        defaultTipAmount.selectedSegmentIndex = index
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipChanged(sender: UISegmentedControl) {
        setDefaultTip()
    }
        func setDefaultTip() {
            NSUserDefaults.standardUserDefaults().setInteger(defaultTipAmount.selectedSegmentIndex, forKey: "defaultTipIndex")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
