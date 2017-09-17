//
//  ViewController.swift
//  AgainWorld
//
//  Created by Murat Has on 17.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameSurnameTv: UILabel!
    @IBOutlet weak var nameSurnameTF: UITextField!
    @IBOutlet weak var GoogleWV: UIWebView!
    @IBAction func changeButton(_ sender: UIButton) {
        self.nameSurnameTv.text=self.nameSurnameTF.text;
        self.nameSurnameTF.text="";
    }
    
    
    @IBOutlet weak var photoIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameSurnameTv.text="Abdul Kerim Bursa"
        self.photoIV.image = UIImage.init(named: "image")
        let xrli = URL(string: "http://www.google.com.tr")
        let urlRequest = URLRequest(url: xrli!)
        self.GoogleWV.loadRequest(urlRequest )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

