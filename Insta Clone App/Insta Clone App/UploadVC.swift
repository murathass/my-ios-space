//
//  UploadVC.swift
//  Insta Clone App
//
//  Created by Murat Has on 25.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class UploadVC: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var uuid = NSUUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(UploadVC.imageClicked))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    @IBAction func post(_ sender: Any) {
        
        
        let folder = Storage.storage().reference().child("media")
        
        
        if let data = UIImageJPEGRepresentation(imageView.image!, 0.5){
            
            folder.child("\(uuid).jpg").putData(data, metadata: nil, completion: { (metadata, error) in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    if let imageURL = metadata?.downloadURL()?.absoluteString{
                        let post = ["image":imageURL, "postedby": (Auth.auth().currentUser?.email)!, "posttext":self.textView.text!, "uuid":self.uuid] as [String:Any]
                        
                        Database.database().reference().child("Users").child((Auth.auth().currentUser?.uid)!).child("post").childByAutoId().setValue(post)
                        
                        self.imageView.image = #imageLiteral(resourceName: "asd")
                        self.textView.text = ""
                        self.tabBarController?.selectedIndex = 0
                        
                    }else{
                        print("error")
                    }
                }
            })
        }else{
            let alert = UIAlertController(title: "Warning", message: "Plase Select Image", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func imageClicked(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

