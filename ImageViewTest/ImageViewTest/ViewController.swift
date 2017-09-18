//
//  ViewController.swift
//  ImageViewTest
//
//  Created by Murat Has on 18.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var isKirk = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func changeClicked(_ sender: Any) {
        
        if isKirk {
            imageView.image = UIImage(named: "james.jpg")
            isKirk=false
        }else {
            imageView.image = UIImage(named: "kirk.jpg")
            isKirk = true
        }
    }

}

