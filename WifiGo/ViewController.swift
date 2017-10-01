//
//  ViewController.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 25/09/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIManager.sharedInstance().requestFreeWifiInfo {
            success in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startUpdateMap() -> Void {
        
    }
    
}

