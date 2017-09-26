//
//  FeedCellTableViewCell.swift
//  Insta Clone App
//
//  Created by Murat Has on 26.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class FeedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameTV: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var commentTV: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
