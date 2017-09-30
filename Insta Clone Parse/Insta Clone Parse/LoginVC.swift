//
//  LoginVC.swift
//  Insta Clone Parse
//
//  Created by Murat Has on 27.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signIN(_ sender: Any) {
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    @IBAction func signUP(_ sender: Any) {
        
    }
}
