//
//  ViewController.swift
//  Colors
//
//  Created by Murat Has on 18.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func white(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    @IBAction func black(_ sender: Any) {
        view.backgroundColor = UIColor.black
    }
    
    @IBAction func blue(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    
    @IBAction func green(_ sender: Any) {
        view.backgroundColor = UIColor.green
    }
    
    @IBAction func red(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }

}

