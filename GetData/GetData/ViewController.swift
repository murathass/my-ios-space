//
//  ViewController.swift
//  GetData
//
//  Created by Murat Has on 22.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var headers = [String]()
    var contents = [String]()
    var images = [String]()
    var dates = [String]()
    
    @IBOutlet weak var listView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let urlStr = "http://www.bucayapimarket.com/json.php"
        let urlobj = URL(string: urlStr)
        let task = URLSession.shared.dataTask(with: urlobj!)
        { (data, respose, error) in
            if error != nil
            {
                print(error!)
            }
            else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                    
                    for i in 0..<json.count
                    {
                        let boyalar = json[i] as! NSDictionary
                        self.headers.append(boyalar["baslik"] as! String )
                        self.contents.append(boyalar["icerik"] as! String )
                        self.images.append(boyalar["resim"] as! String )
                        self.dates.append(boyalar["tarih"] as! String )
                    }
                    print(self.headers)
                    print("----")
                    print(self.contents)
                    print("----")
                    print(self.images)
                    print("----")
                    print(self.dates)
                    print("----")
            
                }catch{
                    print(error)
                }
            }
            
            DispatchQueue.main.async {
                self.listView.reloadData()
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.headers.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ProductTableViewCell
        
        cell.layer.cornerRadius=10 //set corner radius here
        cell.layer.borderColor = UIColor.white.cgColor  // set cell border color here
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 2 // set border width here
        /*
        let url = URL(string: "\(images[indexPath.row])")
        
        let data = try? Data(contentsOf: url!)
        
        if data != nil {
            cell.paintImage.image = UIImage(data: data!)
        }
        */
        cell.paintImage.sd_setImage(with: URL(string: "\(images[indexPath.row])"), placeholderImage: UIImage(named: "image\(indexPath.row).png"))
        cell.headerTV.text = headers[indexPath.row]
        cell.contentTV.text = contents[indexPath.row]
        cell.remainingTime.text = "3 gün kaldı"
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}

