//
//  DetailViewController.swift
//  ViewTable
//
//  Created by Murat Has on 19.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    var imageIndex = "";
    var imageName = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)
        label.text = imageIndex

    }

}
