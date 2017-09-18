//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Murat Has on 18.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    
    var isKirk = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    
    func changePic(){
        print("Clicked")
        if isKirk {
            imageView.image = UIImage.init(named: "james.jpg")
            textView.text = "James"
            isKirk = false
        }else {
            imageView.image = UIImage.init(named: "kirk.jpg")
            textView.text = "Krik"
            isKirk = true
        }
    }

}

