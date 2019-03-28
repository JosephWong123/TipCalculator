//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Joseph Wong on 3/27/19.
//  Copyright © 2019 Joseph Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tipper"
        billField.becomeFirstResponder()
        
    }


    @IBAction func onTap(_ sender: Any) {
        // view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f ", tip)
        billLabel.text = String(format: "$%.2f ", total)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        super.viewWillAppear(animated)
        let bill = Double(billField.text!) ?? 0
        let tip = bill * defaults.double(forKey: "percent")
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f ", tip)
        billLabel.text = String(format: "$%.2f ", total)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        if defaults.bool(forKey: "Dark") {
            self.view.backgroundColor = UIColor.black
            billField.backgroundColor = UIColor.black
            billField.textColor = UIColor.white
            tipLabel.textColor = UIColor.white
            billLabel.textColor = UIColor.white
            Label1.textColor = UIColor.white
            Label2.textColor = UIColor.white
            Label3.textColor = UIColor.white
            tipControl.backgroundColor = UIColor.black
            tipControl.tintColor = UIColor.orange
        }
        else {
            self.view.backgroundColor = UIColor.white
            billField.backgroundColor = UIColor.white
            billField.textColor = UIColor.black
            Label1.textColor = UIColor.black
            Label2.textColor = UIColor.black
            Label3.textColor = UIColor.black
            tipLabel.textColor = UIColor.black
            billLabel.textColor = UIColor.black
            tipControl.backgroundColor = UIColor.white
            tipControl.tintColor = UIColor.blue
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }


}

