//
//  FeedVC.swift
//  Insta Clone App
//
//  Created by Murat Has on 25.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FeedVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayMails = [String]()
    var arrayComments = [String]()
    var arrayImageURLs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getData()
    }
    
    func getData(){
        Database.database().reference().child("Users").observe(DataEventType.childAdded, with: { (snapshot) in
            
            let values = snapshot.value as! NSDictionary
            let posts = values["post"] as! NSDictionary
            
            let allkeys = posts.allKeys
            
            for key in allkeys {
                let obj = posts[key] as! NSDictionary
                self.arrayComments.append(obj["posttext"]! as! String)
                self.arrayMails.append(obj["postedby"]! as! String)
                self.arrayImageURLs.append(obj["image"] as! String)
            }
            
            self.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayImageURLs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCellTableViewCell
        cell.commentTV.text = self.arrayComments[indexPath.row]
        cell.usernameTV.text = self.arrayMails[indexPath.row]
        let url = URL(string: "\(self.arrayImageURLs[indexPath.row])")
        
        let data = try? Data(contentsOf: url!)
        
        if data != nil {
            cell.imageV.image = UIImage(data: data!)
        }
        
        return cell
    }


    @IBAction func signOut(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.synchronize()
        
        let signIU = self.storyboard?.instantiateViewController(withIdentifier: "signIU")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = signIU
        
        appDelegate.rememberLogin()
        
    }

}

