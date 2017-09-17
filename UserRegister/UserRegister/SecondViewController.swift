//
//  SecondViewController.swift
//  UserRegister
//
//  Created by Murat Has on 26.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTV: UITextField!
    @IBOutlet weak var surnameTV: UITextField!
    @IBOutlet weak var emailTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    @IBOutlet weak var repasswordTV: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        let urlString = "http://192.168.43.140:8888/x/index.php"
        let urli = URL(string: urlString)
        
        var request = URLRequest(url: urli!)
        print("123")
        request.httpMethod = "POST"
        let parametres = "name=\(nameTV.text!)&surname=\(surnameTV.text!)&email=\(emailTV.text!)&pass=\(passwordTV.text!)"
        request.httpBody = parametres.data(using: String.Encoding.utf8)
        
         let task = URLSession.shared.dataTask(with: request){(data,response,error) in
            if error != nil
            {
                print(error!)
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    print(json!)
                }catch{
                    print(error)
                }
                
                DispatchQueue.main.async {
                    self.nameTV.text = ""
                    self.surnameTV.text = ""
                    self.emailTV.text = ""
                    self.passwordTV.text = ""
                    self.repasswordTV.text = ""
                }
                
            }
        }
        task.resume()
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

