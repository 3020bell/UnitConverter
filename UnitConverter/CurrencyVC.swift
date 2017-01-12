//
//  CurrencyVC.swift
//  UnitConverter
//
//  Created by Nick on 12/01/2017.
//  Copyright © 2017 Nick Bell. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
