//
//  StudentTableViewCell1.swift
//  TableViewPractice
//
//  Created by iOS Training on 12/28/18.
//  Copyright © 2018 iOS Training. All rights reserved.
//

import UIKit

class StudentTableViewCell1: UITableViewCell {
    
    
    @IBOutlet weak var imgViewStudentNames1: UIImageView!
    
    @IBOutlet weak var lblNames1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
