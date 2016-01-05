//
//  ViewController.swift
//  TipCalculator
//
//  Created by Prasanthi Relangi on 1/3/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
 
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    var bill: Double = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //getDefaultValues()
        
        billAmount.becomeFirstResponder()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        getDefaultValues()
        
        
    }
    
    func getDefaultValues() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipSegmentIndex = defaults.integerForKey("default_tip_index")
        tipSegment.selectedSegmentIndex = tipSegmentIndex
        
    }

    func updateBill() {
        let tipPercentages = [0.1,0.15,0.18,0.2]
        let selectedTipPercentage = tipPercentages[tipSegment.selectedSegmentIndex]
        
        let bill = Double(billAmount.text!)!
        let tip  = selectedTipPercentage*bill
        let total  = bill + tip
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        
        
        //Formatting the amount to be accurate for upto two decimal points
        totalBill.text = String(format: "$%0.2f", total)
        tipAmount.text = String(format: "$%0.2f", tip)
        
        //print("Bill = ",formatter.stringFromNumber(total)!)
        
        totalBill.text = formatter.stringFromNumber(total)!
        tipAmount.text = formatter.stringFromNumber(tip)!
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //To make the keyboard disapper on pressing the return button on the keyboard
    
    func textFieldShouldReturn(textField: UITextField)->Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateBill()
        
    }

    @IBAction func tipValueChanged(sender: AnyObject) {
        
        updateBill()
    }
    
    //tapping anywhere on the screen should make the keyboard go away
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

