//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by Murat Has on 21.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var paintingName: UITextField!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var paintingYear: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.selectImage))
        imageView.addGestureRecognizer(gesture)
    
    }
    
    
    func selectImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Painting", into: context)
        
        entity.setValue(paintingName.text, forKey: "name")
        entity.setValue(artistName.text, forKey: "artist")
        
        if let year = Int(paintingYear.text!){
           entity.setValue(year, forKey: "year")
        }
        
        if let image = UIImageJPEGRepresentation(imageView.image!, 0.5){
            entity.setValue(image, forKey: "image")
        }
        
        
        do{
            try context.save()
            print("succes")
        }catch {
            print("error")
        }
        
                
    }
    
}
