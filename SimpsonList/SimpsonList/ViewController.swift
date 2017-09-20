//
//  ViewController.swift
//  SimpsonList
//
//  Created by Murat Has on 20.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedSimpson = Simpson()
    var arrSimpson = [Simpson]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let bart = Simpson()
        bart.image = UIImage(named: "bart.png")!
        bart.name = "Bart"
        bart.occupation = "Student"
        
        let homer = Simpson()
        homer.image = UIImage(named: "homer.png")!
        homer.name = "Homer"
        homer.occupation = "Student"
        
        let marge = Simpson()
        marge.image = UIImage(named: "marge.png")!
        marge.name = "Marge"
        marge.occupation = "Student"
        
        let lisa = Simpson()
        lisa.image = UIImage(named: "lisa.png")!
        lisa.name = "Bart"
        lisa.occupation = "Student"
        
        let maggie = Simpson()
        maggie.image = UIImage(named: "maggie.png")!
        maggie.name = "Meggie"
        maggie.occupation = "Singer"
        
        
        arrSimpson.append(bart)
        arrSimpson.append(homer)
        arrSimpson.append(marge)
        arrSimpson.append(lisa)
        arrSimpson.append(maggie)

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSimpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrSimpson[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedSimpson = arrSimpson[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.handle = self.selectedSimpson
        }
    }

}

