//
//  ViewController.swift
//  Prework
//
//  Created by Seyi Olajuyi on 8/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var partySizeAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var partySizeControl: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        updateSplitValue()
    }
    
    
    @IBAction func updatePartySize(_ sender: Any) {
        
        //Retrieve the value from partySizeAmountLabel
        let partySize = partySizeControl.value
        
        //Update Party Size Amount
        partySizeAmountLabel.text = String(format: "%.0f", partySize)
        
        updateSplitValue()
        
    }
    
    func updateSplitValue() {
        
        // Retrieve the value from counter
        let partySize = partySizeControl.value
        
        //Retrieving value from totalLabel
        let totalString = totalLabel.text
        
        // Removing the dollar sign in front of text
        let newTotalString = totalString!
        let startIndex = newTotalString.index(newTotalString.startIndex, offsetBy: 1)
        
        let indexRange = startIndex..<newTotalString.endIndex
        
        let finalTotalString = newTotalString[indexRange]
        
        //Converting the formatted value to Double
        let total = Double(finalTotalString) ?? 0
        
        // Calculate individual split value
        let perPersonValue = total / partySize
        
        //Update Per Person Amount
        perPersonAmountLabel.text = String(format: "$%.2f", perPersonValue)
        
    }
    
}

