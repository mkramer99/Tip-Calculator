//
//  ViewController.swift
//  Prework
//
//  Created by Melanie Kramer on 7/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitControl: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var split = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitControl.minimumValue = 1
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        tipControl.setTitle(String(TipPercents.one*100)+"%", forSegmentAt: 0)
        tipControl.setTitle(String(TipPercents.two*100)+"%", forSegmentAt: 1)
        tipControl.setTitle(String(TipPercents.three*100)+"%", forSegmentAt: 2)    }
    // get tip % and calculate
    @IBAction func calculateTip(_ sender: Any) {
        calculate()
    }
    
    // get split value from stepper and calculate
    @IBAction func splitBill(_ sender: UIStepper) {
        splitLabel.text = Int(sender.value).description
        split = Int(sender.value)
        calculate()
    }
    // calculate the tip and bill base on tip % and split
    func calculate() {
        var bill = Double(billAmountTextField.text!) ?? 0
        bill = bill / Double(split)
        // get total tip tip * tipPercentage
        let tipPercentages = [TipPercents.one, TipPercents.two, TipPercents.three]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }

}
