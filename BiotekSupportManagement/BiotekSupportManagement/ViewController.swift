//
//  ViewController.swift
//  BiotekSupportManagement
//
//  Created by Murat Has on 18.08.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "http://31.210.67.61:3000/authenticate/web"

    @IBOutlet weak var emailTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        let user = String(describing: emailTV.text!)
        let pass = String(describing: passwordTV.text!)
         let urli = URL(string: urlString)
         var request = URLRequest(url: urli!)
         request.httpMethod = "POST"
         let parametres = "email=\(user)&password=\(pass)"
         request.httpBody = parametres.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request){(data,response,error) in
            if error != nil
            {
                print(error!)
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print(json)
                    DispatchQueue.main.async {
                        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomePage") as! HomeViewController
                        self.present(homeVC, animated: true, completion: nil)
                    }  
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



}

