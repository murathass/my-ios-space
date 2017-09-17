//
//  ViewController.swift
//  AlertDialog
//
//  Created by Murat Has on 17.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


    @IBAction func singUpClciked(_ sender: Any) {
        
        if nameTF.text == "" {
            let alert = UIAlertController(title: "Warning", message: "Name Field is Empty", preferredStyle: .alert)
            let button = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else if passwordTF.text == ""{
            let alert = UIAlertController(title: "Warning", message: "Password Field is Empty", preferredStyle: .alert)
            let button = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else if passwordTF.text != repasswordTF.text {
            let alert = UIAlertController(title: "Warning", message: "Passwords are not matching", preferredStyle: .alert)
            let button = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Success", message: "Signed up", preferredStyle: .alert)
            let button = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        }
        
       
    }

}

