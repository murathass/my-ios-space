//
//  ViewController.swift
//  BiometricAuthentication
//
//  Created by Murat Has on 24.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var statusTV: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authContext = LAContext()
        
        var error : NSError?
        
        authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Bu Gördüğüm sen misin?") { (success, error) in
            
            if success {
                self.statusTV.text = "Status : Success"
            }else {
                self.statusTV.text = "Status : Error"
            }
        }
        
    }


}

