//
//  TableViewController.swift
//  On The Map
//
//  Created by Zulwiyoza Putra on 1/15/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit

class TableViewController: MainViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.hidesBarsOnSwipe = true
        
        executeOnMain(withDelay: 1.0) {
            self.getStudents()
        }
        
    }
    
    override func refresh() {
        super.refresh()
        DataSource.getStudents {
            self.executeOnMain {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        if self.navigationController?.isNavigationBarHidden == true {
            return true
        } else {
            return false
        }
    }
    
    func getStudents() {
        if DataSource.students.count == 0 {
            
            guard isConnectedToNetwork() else {
                presentErrorAlertController("Network Connection Error", alertMessage: "No network connection, please try again later")
                return
            }
            
            let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            let view = UIView(frame: frame)
            view.backgroundColor = .white
            self.view.addSubview(view)
            
            self.state(state: .loading, activityIndicator: activityIndicator, background: backgroundView)
            
            DataSource.getStudents { (students: [Student]) in
                DataSource.students = students
                self.executeOnMain {
                    view.removeFromSuperview()
                    self.state(state: .normal, activityIndicator: self.activityIndicator, background: self.backgroundView)
                    self.tableView.reloadData()
                }
            }
        }
    }


}

// Table View Delegate
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Student's Cell", for: indexPath)
        let student = DataSource.students[indexPath.row]
        cell.textLabel?.text = (student.firstName!) + " " + (student.lastName!)
        cell.detailTextLabel?.textColor = Udacity.Color.green
        
        if let mediaURL = student.mediaURL {
            let stringURL = String(describing: mediaURL)
            cell.detailTextLabel?.text = stringURL
        } else {
            cell.detailTextLabel?.text = "Unknown Media URL"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let student = DataSource.students[indexPath.row]
        if let mediaURL = student.mediaURL {
            let stringURL = String(describing: mediaURL)
            self.presentURLInSafariViewController(stringURL: stringURL)
        }
        
    }
}

// Table View Data Source
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.students.count
    }
}
