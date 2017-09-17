//
//  ProductTableViewCell.swift
//  GetData
//
//  Created by Murat Has on 23.07.2017.
//  Copyright © 2017 murathas. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var paintImage: UIImageView!
    @IBOutlet weak var headerTV: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var contentTV: UILabel!
    @IBOutlet weak var counterTV: UILabel!
    
    
    let now:Int32 = Int32(NSDate().timeIntervalSince1970) + Int32(3*60*60)
    var second = 5
    var timer = Timer()
    var timeReapet = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        counterTV.text = "\(now)"
        //setTime()
        
        //startCounting()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTime(){
        if second != 0 {
            second -= 1
            counterTV.text = "\(second)"
        }else{
            print("invalidate")
            timer.invalidate()
        }
    }
    
    func startCounting(){
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ProductTableViewCell.setTime), userInfo: nil, repeats: timeReapet)
        
    }


}
