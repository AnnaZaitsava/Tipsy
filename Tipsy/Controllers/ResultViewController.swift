//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Anna Zaitsava on 16.08.23.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue: String?
    var settingProperty: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalValue
        settingsLabel.text = settingProperty
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
