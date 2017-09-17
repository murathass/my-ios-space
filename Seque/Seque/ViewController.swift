//
//  ViewController.swift
//  Seque
//
//  Created by Murat Has on 17.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    var name = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveClicked(_ sender: Any) {
        self.name = nameTF.text!
        performSegue(withIdentifier: "go2second", sender: nil)
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go2second" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.name = self.name
        }
    }
    

}

