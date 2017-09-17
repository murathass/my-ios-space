//
//  ViewController.swift
//  Calculator
//
//  Created by Murat Has on 14.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var secondNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sum(_ sender: Any) {
        if let x1 = Int(firstNumber.text!)
        {
            if let x2 = Int(secondNumber.text!) {
                result.text = "\(x1 + x2)"
            }
        }
    }
    
    @IBAction func sub(_ sender: Any) {
        if let x1 = Int(firstNumber.text!)
        {
            if let x2 = Int(secondNumber.text!) {
                result.text = "\(x1 - x2)"
            }
        }
    }
    @IBAction func mux(_ sender: Any) {
        if let x1 = Int(firstNumber.text!)
        {
            if let x2 = Int(secondNumber.text!) {
                result.text = "\(x1 * x2)"
            }
        }
    }
    
    @IBAction func div(_ sender: Any) {
        if let x1 = Int(firstNumber.text!)
        {
            if let x2 = Int(secondNumber.text!) {
                result.text = "\(x1 / x2)"
            }
        }
    }
}

