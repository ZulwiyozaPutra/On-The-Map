//
//  MainViewController.swift
//  On The Map
//
//  Created by Zulwiyoza Putra on 6/15/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MainViewController: UIViewController {
    
    var students = [Student]()
    
    var logOutBarButton = UIBarButtonItem()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let barButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOut))
        logOutBarButton = barButtonItem
        
    }
    
    func logOut() {
        dismiss(animated: true) {
            print("View get dismissed")
            UdacityClient.deleteSession()
            UserDefaults.standard.set(false, forKey: "isAuthenticated")
        }
    }
    
    func getStudents(_ completion: @escaping (_ students: [Student]) -> Void) {
        ParseClient.getStudentLocation { (students: [Student]?, error: RequestError?, errorDescription: String?) in
            guard students != nil else {
                return
            }
            completion(students!)
        }
    }
    
    func getAnnotations(_ completion: @escaping (_ completion: [MKPointAnnotation])-> Void) {
        var annotations = [MKPointAnnotation]()
        getStudents { (students: [Student]) in
            for student in students {
                let annotation = MKPointAnnotation()
                if let coordinate = student.location?.coordinate {
                    annotation.coordinate = coordinate
                } else {
                    annotation.coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
                }
                annotation.title = "\(student.firstName ?? "") \(student.lastName ?? "")"
                annotation.subtitle = String(describing: student.mediaURL)
                
                annotations.append(annotation)
            }
            completion(annotations)
        }
    }

    
}
