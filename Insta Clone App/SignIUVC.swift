//
//  SignIUVC.swift
//  Insta Clone App
//
//  Created by Murat Has on 25.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignIUVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signIN(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!, completion: { (user, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
                UserDefaults.standard.set(user?.email, forKey: "email")
                UserDefaults.standard.synchronize()
                
                self.performSegue(withIdentifier: "toTabBar", sender: nil)
                
            }
        })
    }
    
    @IBAction func signUP(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!, completion: { (user, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                UserDefaults.standard.set(user?.email, forKey: "email")
                UserDefaults.standard.synchronize()
                
                /*let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.rememberLogin()*/
                
                
                self.performSegue(withIdentifier: "toTabBar", sender: nil)
            }
            
        })
    }
}
