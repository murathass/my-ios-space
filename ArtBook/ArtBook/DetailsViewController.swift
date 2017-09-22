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
    
    var selectName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.selectImage))
        imageView.addGestureRecognizer(gesture)
        
        
        if self.selectName != "" {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "Painting")
            fetchRequest.predicate = NSPredicate(format: "name = %@", selectName)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String{
                            self.paintingName.text = name
                        }
                        
                        if let image = result.value(forKey: "image") as? Data{
                            self.imageView.image = UIImage(data: image)
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String{
                            self.artistName.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int{
                            self.paintingYear.text = String(year)
                        }
                    }
                }
                
            }catch{
                print("error")
            }
            
        }else{
            imageView.image = nil
            paintingYear.text = ""
            paintingName.text = ""
            artistName.text = ""
        }
    
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
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PaintingReflesh"), object: nil)
        self.navigationController?.popViewController(animated: true)
                
    }
    
}
