//
//  ViewController.swift
//  NCTest
//
//  Created by Murat Has on 31.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btn(_ sender: Any) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomePageNC") as! UINavigationController
        
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

