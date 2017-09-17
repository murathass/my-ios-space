//
//  ViewController.swift
//  NewsApp
//
//  Created by Murat Has on 2.08.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit
import AEXML

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var titles = [String]()
    var urls = [String]()
    var imageUrls = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let
            xmlPath = Bundle.main.path(forResource: "cevre", ofType: "xml"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: xmlPath))
            else { return }
        
        do{
            let options = AEXMLOptions()
            let xmlDoc = try AEXMLDocument(xml: data, options: options)
            
            let items = xmlDoc.root["item"].all
            
            for item in items!
            {
                titles.append(item["title"].string)
                urls.append(item["link"].string)
                imageUrls.append(item["enclosure"].attributes["url"]!)
            
            }
        }catch{
            print(error)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titles.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! NewsTableViewCell
        let url = URL(string: "\(imageUrls[indexPath.row])")
        
        let data = try? Data(contentsOf: url!)
        
        if data != nil {
            cell.newsImage.image = UIImage(data: data!)
        }
        cell.newsTitle.text = titles[indexPath.row]
        cell.newsUrl.text = urls[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newsdetailVC = storyboard.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailViewController
        newsdetailVC.url = self.urls[indexPath.row]
        self.present(newsdetailVC, animated: true, completion: nil)
    }


}

