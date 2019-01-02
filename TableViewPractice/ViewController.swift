//
//  ViewController.swift
//  TableViewPractice
//
//  Created by iOS Training on 12/26/18.
//  Copyright © 2018 iOS Training. All rights reserved.
//

import UIKit

import Kingfisher





struct StudentDataModel {
    var name: String = ""
    var imageURL: String = ""
}

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableContentOfStudentNames: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var arrayStudentNames = [StudentDataModel]()
    var arrayStudentNamesFiltered = [StudentDataModel]()
    var selectedStudentObj: StudentDataModel?
    
    // let arrayStudentNames = ["Ganesh","Priyatham","Hani","Vamsi","venky","Ganesh1","Priyatham1","Hani1","Vamsi1","venky1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContentOfStudentNames.dataSource = self
        tableContentOfStudentNames.delegate = self
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        for i in 1...100 {
            let student = StudentDataModel(name: "Student Name - \(i)", imageURL: "https://randomuser.me/api/portraits/men/\(i).jpg")
            arrayStudentNames.append(student)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cell1_details" {
            if let studentDetailsViewController = segue.destination as? StudentDetailsViewController {
                if selectedStudentObj != nil {
                    studentDetailsViewController.studentDetails = selectedStudentObj
                }
            }
            
        } else if segue.identifier == "cell2_details" {
            if let studentDetailsViewController = segue.destination as? StudentDetailsViewController {
                if selectedStudentObj != nil {
                    studentDetailsViewController.studentDetails = selectedStudentObj
                }
            }
            
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchBar.isFirstResponder {
            return arrayStudentNamesFiltered.count
        }
        
        return arrayStudentNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let dequedCell = tableView.dequeueReusableCell(withIdentifier: "cell_identifier", for: indexPath) as! StudentTableViewCell
            
            let student = searchBar.isFirstResponder ? arrayStudentNamesFiltered[indexPath.row]: arrayStudentNames[indexPath.row]
            // let lblName = dequedCell.contentView.viewWithTag(200) as! UILabel
            dequedCell.lblName.text = student.name
            
            // let imgViewStudent = dequedCell.contentView.viewWithTag(300) as! UIImageView
            // imgViewStudent.backgroundColor = UIColor.brown
            let url = URL(string: student.imageURL)
            dequedCell.imgViewStudent.kf.setImage(with: url)
            
            return dequedCell
            
        } else {
            
            if indexPath.section == 1 {
                let dequedCell = tableView.dequeueReusableCell(withIdentifier: "cell_identifier1", for: indexPath) as! StudentTableViewCell1
                let student = searchBar.isFirstResponder ? arrayStudentNamesFiltered[indexPath.row]: arrayStudentNames[indexPath.row]
                // let lblName = dequedCell.contentView.viewWithTag(200) as! UILabel
                dequedCell.lblNames1.text = student.name
                
                // let imgViewStudent = dequedCell.contentView.viewWithTag(300) as! UIImageView
                // imgViewStudent.backgroundColor = UIColor.brown
                let url = URL(string: student.imageURL)
                dequedCell.imgViewStudentNames1.kf.setImage(with: url)
                
                return dequedCell
                
            }
            
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" hey you selected \(indexPath.section) section and \(indexPath.row)")
        
        let student = searchBar.isFirstResponder ? arrayStudentNamesFiltered[indexPath.row] : arrayStudentNames[indexPath.row]
        selectedStudentObj = student
        
        if(indexPath.section == 0) {
            self.performSegue(withIdentifier: "cell1_details",   sender: nil)
        } else if(indexPath.section == 1) {
            self.performSegue(withIdentifier: "cell2_details",   sender: nil)
        }
        
//
//        if let studentDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "StudentDetailsViewController") as? StudentDetailsViewController {
//            studentDetailsViewController.studentDetails = student
//            self.navigationController?.pushViewController(studentDetailsViewController, animated: true)
//        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        arrayStudentNamesFiltered = arrayStudentNames.filter({ (StudentModel) -> Bool in
            return StudentModel.name.contains(searchText)
        })
        
        tableContentOfStudentNames.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        tableContentOfStudentNames.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        arrayStudentNamesFiltered = arrayStudentNames
    }
    
    
    
}

extension UIViewController: UITableViewDelegate {
    
}


