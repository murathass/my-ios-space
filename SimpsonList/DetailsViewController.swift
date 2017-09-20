//
//  DetailsViewController.swift
//  SimpsonList
//
//  Created by Murat Has on 20.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTV: UILabel!
    @IBOutlet weak var occupation: UILabel!
    
    var handle:Simpson? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imageView.image = self.handle?.image
        self.nameTV.text = self.handle?.name
        self.occupation.text = self.handle?.occupation
        
        print("\(self.nameTV.text)")
        
    }

}
