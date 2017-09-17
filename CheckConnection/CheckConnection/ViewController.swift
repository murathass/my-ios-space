//
//  ViewController.swift
//  CheckConnection
//
//  Created by Murat Has on 31.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit
import EFInternetIndicator

class ViewController: UIViewController , InternetStatusIndicable{
    
    var internetConnectionIndicator:InternetViewIndicator?
    @IBOutlet weak var textTF: UITextField!
    
    @IBAction func button(_ sender: Any) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomePage") as! HomeViewController
        homeVC.elem = self.textTF.text!
        self.present(homeVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startMonitoringInternet(backgroundColor: UIColor.cyan, style: .StatusLine , textColor: UIColor.white, message: " !----- Internet ------! ", remoteHostName: "google.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

