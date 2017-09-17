//
//  ViewController.swift
//  LocalNotiftyExample
//
//  Created by Murat Has on 3.08.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var permission:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [ .alert, .sound, .badge ]) { (permission, error) in
                self.permission = permission
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button(_ sender: Any) {
        
        if permission
        {
            let content = UNMutableNotificationContent()
            content.title = "title"
            content.subtitle = "subtitle"
            content.body = "İlacınızı almayı unutmayınız."
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "first", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
        
        
    }
    
}
