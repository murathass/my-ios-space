//
//  ViewController.swift
//  ViewTable
//
//  Created by Murat Has on 19.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arrName = ["Bir","İki","Üç","Dört","Beş"]
    var arrImagesName = ["1.png","2.png","3.jpeg","4.png","5.jpg"]
    
    var selectedImageName = ""
    var selectedImageIndex = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.imageView?.image = UIImage(named: arrImagesName[indexPath.row])
        cell.textLabel?.text = arrName[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            arrName.remove(at: indexPath.row)
            arrImagesName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // Segue Başlamadan Hemen önce çalışır
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let destinatinVC = segue.destination as! DetailViewController
            destinatinVC.imageName = self.selectedImageName
            destinatinVC.imageIndex = self.selectedImageIndex
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedImageName = arrImagesName[indexPath.row]
        self.selectedImageIndex = arrName[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: nil)
        
    }
    

}

