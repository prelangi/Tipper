//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Prasanthi Relangi on 1/3/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTipSetting: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipSegmentIndex = defaults.integerForKey("default_tip_index")
        defaultTipSetting.selectedSegmentIndex = tipSegmentIndex
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        //defaults.setObject("default_tip_percent", forKey: "some_key_that_you_choose")
        defaults.setInteger(defaultTipSetting.selectedSegmentIndex, forKey: "default_tip_index")
        defaults.synchronize()
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
