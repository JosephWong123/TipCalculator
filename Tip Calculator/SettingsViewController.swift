//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Joseph Wong on 3/28/19.
//  Copyright © 2019 Joseph Wong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var darkSwitch: UISwitch!
    
    @IBAction func enableDarkMode(_ sender: UISwitch) {
        
        if sender.isOn {
            defaults.set(true, forKey:"Dark")
            self.view.backgroundColor = UIColor.black
            Label2.textColor = UIColor.white
            Label1.textColor = UIColor.white
            defaultTipControl.backgroundColor = UIColor.black
            defaultTipControl.tintColor = UIColor.orange
        }
        else {
            defaults.set(false, forKey:"Dark")
            self.view.backgroundColor = UIColor.white
            Label2.textColor = UIColor.black
            Label1.textColor = UIColor.black
            defaultTipControl.backgroundColor = UIColor.white
            defaultTipControl.tintColor = UIColor.blue
        }
        defaults.synchronize()
    }
    @IBAction func changeDefaultPercent(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.2]
        let percent = tipPercentages[tipControl.selectedSegmentIndex]
        defaults.set(percent, forKey: "percent")
        defaults.synchronize()
    }
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if defaults.bool(forKey: "Dark") {
            self.view.backgroundColor = UIColor.black
            Label2.textColor = UIColor.white
            Label1.textColor = UIColor.white
            defaultTipControl.backgroundColor = UIColor.black
            defaultTipControl.tintColor = UIColor.orange
            darkSwitch.setOn(true, animated: false)
        }
        else {
            self.view.backgroundColor = UIColor.white
            Label2.textColor = UIColor.black
            Label1.textColor = UIColor.black
            defaultTipControl.backgroundColor = UIColor.white
            defaultTipControl.tintColor = UIColor.blue
            darkSwitch.setOn(false, animated: false)
        }
    }
        
    
        
        
        

        // Do any additional setup after loading the view.
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
