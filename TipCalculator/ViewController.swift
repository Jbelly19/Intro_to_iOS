//
//  ViewController.swift
//  TipCalculator
//
//  Created by Josh Belmont on 12/3/15.
//  Copyright © 2015 Belmont. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mealPriceSlider: UISlider!
    
    @IBOutlet weak var percentTipControl: UISegmentedControl!
    
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    @IBOutlet weak var tipTotalLabel: UILabel!
    
    @IBOutlet weak var mealTotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.lightGrayColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       let index = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipIndex")
        percentTipControl.selectedSegmentIndex = index
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func mealPriceSliderChanged(sender: UISlider) {
        mealPriceLabel.text = NSString(format: "$%.2f", mealPriceSlider.value) as String
        calculateTip()
    }
    @IBAction func percentTipControlChanged(sender: UISegmentedControl) {
        calculateTip()
    }
    
    func calculateTip() {
        var percent: Double!
        switch percentTipControl.selectedSegmentIndex{
        case 0: percent = 0.05
        case 1: percent = 0.10
        case 2: percent = 0.12
        case 3: percent = 0.15
        case 4: percent = 0.20
        default: 0.15
        }
        
        tipTotalLabel.text = NSString(format: "Tip: $%.2f", Double(mealPriceSlider.value) * percent ) as String
        mealTotalLabel.text = NSString(format: "Meal Total: $%.2f", Double(mealPriceSlider.value) + (Double(mealPriceSlider.value) * percent)) as String
        
        
    }
    
}

