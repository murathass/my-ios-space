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
    
    var isAscending = true
    var selectedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.selectedName = ""
        
        
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getData), name: NSNotification.Name(rawValue: "PaintingReflesh"), object: nil)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedName = self.arrNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.selectName = selectedName
        }
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.selectedName = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }


}

