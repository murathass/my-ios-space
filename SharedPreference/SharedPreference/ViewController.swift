//
//  ViewController.swift
//  SharedPreference
//
//  Created by Murat Has on 16.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nameTV: UILabel!
    @IBOutlet weak var emailTV: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = UserDefaults.standard.string(forKey: "name"){
            nameTV.text = "name:\(name)"
        }
        
        if let email = UserDefaults.standard.string(forKey: "email"){
            emailTV.text = "email:\(email)"
        }
    
    }

    @IBAction func clickButton(_ sender: Any) {
        
        if  let name = nameTF.text {
            UserDefaults.standard.set(name, forKey: "name")
            nameTV.text = "name:\(name)"
        }
        
        if let email = emailTF.text {
            UserDefaults.standard.set(email, forKey: "email")
            emailTV.text = "email:\(email)"
        }
        
    }

    @IBAction func deleteButton(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "name") != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameTV.text = "name:"
        }
        
        if UserDefaults.standard.string(forKey: "email") != nil{
            UserDefaults.standard.removeObject(forKey: "email")
            emailTV.text = "email:"
        }
    }

}

