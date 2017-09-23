//
//  TablViewVC.swift
//  Travel Map book
//
//  Created by Murat Has on 22.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import CoreData

class TablViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var titleArray = [String]()
    var subtitleArray = [String]()
    var latitudeArray = [Double]()
    var longitudeArray = [Double]()
    
    var selectedTitle = ""
    var selectedSubTitle = ""
    var selectedLatitude:Double = 0
    var selectedLongitude:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        fetchData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(TablViewVC.fetchData), name: NSNotification.Name(rawValue: "PlaceReflesh"), object: nil)
    }
    
    func fetchData(){
        
        self.titleArray.removeAll(keepingCapacity: false)
        self.subtitleArray.removeAll(keepingCapacity: false)
        self.latitudeArray.removeAll(keepingCapacity: false)
        self.longitudeArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest <NSFetchRequestResult>(entityName: "Place")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do {
            
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    
                    if let title = result.value(forKey: "title") as? String{
                        self.titleArray.append(title)
                    }
                    
                    if let subtitle = result.value(forKey: "subtitle") as? String{
                        self.subtitleArray.append(subtitle)
                    }
                    
                    if let latitude = result.value(forKey: "latitude") as? Double{
                        self.latitudeArray.append(latitude)
                    }
                    
                    if let longitude = result.value(forKey: "longitude") as? Double{
                        self.longitudeArray.append(longitude)
                    }
                }
                self.tableView.reloadData()
            }
            
        }catch{
            print("error")
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTitle = titleArray[indexPath.row]
        self.selectedSubTitle = subtitleArray[indexPath.row]
        self.selectedLatitude = latitudeArray[indexPath.row]
        self.selectedLongitude = longitudeArray[indexPath.row]
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapVC" {
            let mapVC = segue.destination as! MapVC
            mapVC.selectedTitle = self.selectedTitle
            mapVC.selectedSubTitle = self.selectedSubTitle
            mapVC.selectedLatitude = self.selectedLatitude
            mapVC.selectedLongitude = self.selectedLongitude
        }
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        self.selectedTitle = ""
        self.selectedSubTitle = ""
        self.selectedLatitude = 0
        self.selectedLongitude = 0
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
}
