//
//  ViewController.swift
//  TakePhoto
//
//  Created by Murat Has on 31.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var pic: UIImageView!

    @IBAction func btn(_ sender: Any) {
        
        let image  = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true)
        
        
    }
    
    //Resim seçimi bitince getirilen fonksiyon
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            pic.image = picture
        }else{}
        self.dismiss(animated: true)
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

