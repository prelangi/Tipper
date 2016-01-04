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
    @IBOutlet weak var getBill: UIButton!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalBill: UILabel!
    var bill: Double = 0
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func getBill(sender: AnyObject) {
        updateBill()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
    }

    func updateBill() {
        var tipPercentages = [0.1,0.15,0.18,0.2]
        var selectedTipPercentage = tipPercentages[tipSegment.selectedSegmentIndex]
        
        let bill = Double(billAmount.text!)!
        let tip  = selectedTipPercentage*bill
        var total  = bill + tip
        
        
        //Formatting the amount to be accurate for upto two decimal points
        totalBill.text = String(format: "$%0.2f", total)
        tipAmount.text = String(format: "$%0.2f", tip)
        

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
}

