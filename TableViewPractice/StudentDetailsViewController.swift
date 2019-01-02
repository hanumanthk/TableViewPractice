//
//  StudentDetailsViewController.swift
//  TableViewPractice
//
//  Created by iOS Training on 12/28/18.
//  Copyright © 2018 iOS Training. All rights reserved.
//

import UIKit
import Kingfisher


class StudentDetailsViewController: UIViewController {

    
    @IBOutlet weak var imgViewStudent: UIImageView!
    @IBOutlet weak var lblStudentName: UILabel!
    
    var studentDetails:StudentDataModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let studentDetailsObj = studentDetails {
            lblStudentName.text = studentDetailsObj.name
            self.title = studentDetailsObj.name
            let url = URL(string: studentDetailsObj.imageURL)
            imgViewStudent.kf.setImage(with: url)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
