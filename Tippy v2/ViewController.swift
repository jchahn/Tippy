//
//  ViewController.swift
//  Tippy v2
//
//  Created by Jason Hahn on 1/21/17.
//  Copyright © 2017 Jason Hahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstHeight: NSLayoutConstraint!
    @IBOutlet weak var secondHeight: NSLayoutConstraint!
    @IBOutlet weak var billFieldAlignY: NSLayoutConstraint!
    @IBOutlet var billFieldAlignX: NSLayoutConstraint!
    @IBOutlet weak var billFieldTrailing: NSLayoutConstraint!
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet var dollarTrailing: NSLayoutConstraint!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.billField.becomeFirstResponder()
        self.billField.font = UIFont(name: "Helvetica", size: 70)
        self.dollarLabel.font = UIFont(name: "Helvetica", size: 70)
        self.tipLabel.font = UIFont(name: "Helvetica", size: 32)
        self.plusLabel.font = UIFont(name: "Helvetica", size: 32)
        self.totalLabel.font = UIFont(name: "Helvetica", size: 56)
        self.equalsLabel.font = UIFont(name: "Helvetica", size: 32)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        // view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if (billField.text?.isEmpty ?? true){
            self.firstHeight.constant = 568
            self.billFieldAlignY.constant = 160
            self.billFieldAlignX.isActive = true
            self.billField.textAlignment = .left
            self.billField.font = UIFont(name: "Helvetica", size: 70)
            self.dollarLabel.font = UIFont(name: "Helvetica", size: 70)
            self.billField.alpha = 1.0
            self.dollarLabel.alpha = 1.0
            self.dollarTrailing.isActive = true
            self.secondHeight.constant = 0
            self.tipControl.isHidden = true
        }
        else {
            self.firstHeight.constant = 110
            self.billFieldAlignY.constant = 33
            self.billFieldAlignX.isActive = false
            self.billField.textAlignment = .right
            self.billField.font = UIFont(name: "Helvetica", size: 32)
            self.dollarLabel.font = UIFont(name: "Helvetica", size: 32)
            self.billField.alpha = 0.62
            self.tipControl.alpha = 0.65
            self.dollarLabel.alpha = 0.95
            self.dollarTrailing.isActive = false
            self.tipLabel.alpha = 0.65
            self.plusLabel.alpha = 0.95
            self.equalsLabel.alpha = 0.95
            self.secondHeight.constant = 458
            self.tipControl.isHidden = false
        }
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }

}
