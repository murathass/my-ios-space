//
//  ViewController.swift
//  ArtBook
//
//  Created by Murat Has on 21.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrNames = [String]()
    var arrImage = [UIImage]()
    var arrYear = [Int]()
    var arrArtist = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData(){
        
        arrNames.removeAll(keepingCapacity: false)
        arrImage.removeAll(keepingCapacity: false)
        arrYear.removeAll(keepingCapacity: false)
        arrArtist.removeAll(keepingCapacity: false)
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
    
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Painting")
        //Verileri tek tek çekip dizilere ekleyebilmek için kullanılıyormuş
        fetchRequest.returnsObjectsAsFaults = true
    
        do{
    
            let results = try context.fetch(fetchRequest)
    
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
    
                    if let name = result.value(forKey: "name") as? String {
                        self.arrNames.append(name)
                    }
                    
                    if let year = result.value(forKey: "year") as? Int {
                        self.arrYear.append(year)
                    }
                    
                    if let artist = result.value(forKey: "artist") as? String {
                        self.arrArtist.append(artist)
                    }
                
                    if let data = result.value(forKey: "image") as? Data {
                        self.arrImage.append(UIImage(data: data)!)
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }catch{
            print("error")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrNames[indexPath.row]
        cell.imageView?.image = arrImage[indexPath.row]
        return cell
    }
    
    
    
    
}

