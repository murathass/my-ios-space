//
//  ViewController.swift
//  CurrencyApp
//
//  Created by Murat Has on 25.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UISearchBarDelegate{

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var ilsLabel: UILabel!
    @IBOutlet weak var idrLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        
        
        let url = URL(string: "http://api.fixer.io/latest?base=\(searchBar.text!)")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String, AnyObject>
                    
                    let rates = json["rates"] as! [String:AnyObject]
                    
                    
                    DispatchQueue.main.async{
                        
                    
                    self.gbpLabel.text = self.gbpLabel.text!+":"+String(describing: rates["GBP"]!)
                    self.ilsLabel.text = self.ilsLabel.text!+":"+String(describing: rates["ILS"]!)
                    self.idrLabel.text = self.idrLabel.text!+":"+String(describing: rates["IDR"]!)
                    
                    }
                    
                    print(json)
                }catch{
                    print(error)
                }
            }
        }
        
        task.resume()
        
    }


}

