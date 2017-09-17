//
//  ViewController.swift
//  HelloSwift
//
//  Created by Murat Has on 22.06.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var webView: UIWebView!
    
    let strings = ["Deneme1","Deneme2","Deneme3","Deneme4","Deneme5"]

    @IBAction func change(_ sender: UIButton) {
        image.image = UIImage(named: "resim")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath)
        cell.textLabel?.text = strings[indexPath.row]
        
        return cell;
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return strings.count;
    }
    
}

