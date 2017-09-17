//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Murat Has on 3.08.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Gelinen url :  \(url)")
        webView.loadRequest(URLRequest(url: URL(string: url)!))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
