//
//  FirstViewController.swift
//  UserRegister
//
//  Created by Murat Has on 26.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var emailTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    @IBAction func loginButton(_ sender: Any) {
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomePage") as! HomeViewController
        
        self.present(homeVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

