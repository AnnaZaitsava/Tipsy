//
//  ViewController.swift
//  Tipsy
//
//  Created by Anna Zaitsava on 16.08.23.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tipAmount = 0.00
    var splitBetweenNumber = 2
    var billTotalAmount = 0.0
    var result = ""
    var tip = ""
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tip = sender.currentTitle!
        
        let selectedTipAmount = Double(tip.dropLast())
        
        tipAmount = selectedTipAmount!  / 100
        
        }
            
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitBetweenNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let bill = billTextField.text!
        if billTextField != nil {
            billTotalAmount = Double(bill)!
        }
       
        let calculatedBill =  Double(((billTotalAmount * tipAmount)
        + billTotalAmount)  / Double(splitBetweenNumber))
        
        result =  String(format: "%.2f", calculatedBill)
        
        
        self.performSegue(withIdentifier: "showResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.settingProperty = "Split between \(splitBetweenNumber) people, with \(tip) tip."
            destinationVC.totalValue = result
        }
    }
}

