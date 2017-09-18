//
//  ViewController.swift
//  Timers
//
//  Created by Murat Has on 18.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var counter = 10;
    
    @IBOutlet weak var counterTV: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterTV.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.reaapet), userInfo: nil, repeats: true)
    
    }

    func reaapet(){
        
        //print("\(counter)");
        counterTV.text = "\(counter)"
        counter = counter-1
        
        if counter < 0 {
            timer.invalidate()
        }
    }

}

