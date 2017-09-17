//
//  SecondViewController.swift
//  Seque
//
//  Created by Murat Has on 17.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTV: UILabel!
    
    var name = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTV.text = name;

    }

    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
