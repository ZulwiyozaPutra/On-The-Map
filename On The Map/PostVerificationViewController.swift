//
//  PostVerificationViewController.swift
//  On The Map
//
//  Created by Zulwiyoza Putra on 6/15/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import MapKit

class PostVerificationViewController: PostingViewController {
    
    static var placemark: CLPlacemark? = nil

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.showAnnotations([MKPlacemark(placemark: PostVerificationViewController.placemark!)], animated: true)
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
