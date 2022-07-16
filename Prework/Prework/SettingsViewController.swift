//
//  SettingsViewController.swift
//  Prework
//
//  Created by Melanie Kramer on 7/15/22.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var fieldOne: UITextField!
    @IBOutlet weak var fieldTwo: UITextField!
    @IBOutlet weak var fieldThree: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fieldOne.placeholder = String(TipPercents.one)
        fieldTwo.placeholder = String(TipPercents.two)
        fieldThree.placeholder = String(TipPercents.three)

        fieldOne.keyboardType = UIKeyboardType.decimalPad
        fieldTwo.keyboardType = UIKeyboardType.decimalPad
        fieldThree.keyboardType = UIKeyboardType.decimalPad
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save" {
            if let tipOne = Double(fieldOne.text!) {
                TipPercents.one = tipOne
            }
            else {
                print("error one")
            }
            if let tipTwo = Double(fieldTwo.text!) {
                TipPercents.two = tipTwo
            }
            else {
                print("error two")
            }
            if let tipThree = Double(fieldThree.text!) {
                TipPercents.three = tipThree
            }
            else {
                print("error three")
            }
        }
    }
    @IBAction func save(_ sender: Any) {
        let alert = UIAlertController(title: "Sucess", message: "Saved New Tips!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in self.performSegue(withIdentifier: "Save", sender: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func oneFunc(_ sender: Any) {
        fieldOne.keyboardType = UIKeyboardType.decimalPad
    }
    @IBAction func twoFunc(_ sender: Any) {
        fieldTwo.keyboardType = UIKeyboardType.decimalPad
    }
    @IBAction func threeFunc(_ sender: Any) {
        fieldThree.keyboardType = UIKeyboardType.decimalPad
    }
}
