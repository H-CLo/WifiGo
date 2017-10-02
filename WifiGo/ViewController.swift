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
    
    let locationManager = LocationManager.sharedInstance()
    let apiManager = APIManager.sharedInstance()
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    // MARK : view lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        startSetupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK : Normal functions
    
    // Default setup func
    
    func setup() -> Void {
        
        setupMapkit()
        setupLocationManager()
    }
    
    func setupMapkit() -> Void {
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    func setupLocationManager() -> Void {
        locationManager.delegate = self
        locationManager.setup()
        locationManager.requestAuthorization()
    }
    
    // setup data on map
    
    func startSetupData() -> Void {
        
        // request
        apiManager.requestFreeWifiInfo {
            success in
            
            self.startDisplayData()
        }
    }
    
    func startDisplayData() -> Void {
        
        let info = apiManager.freeWifiDict
        
        for (_, value) in info.enumerated() {
            
            // 2.準備 region 會用到的相關屬性
            let title = value.name ?? ""
            
            var coordinate = CLLocationCoordinate2DMake(0, 0)
            
            if let la = value.latitude, let lo = value.longtitude {
                coordinate = CLLocationCoordinate2DMake(Double(la)!, Double(lo)!)
            }
            let regionRadius = 300.0
            
            // 3. 設置 region 的相關屬性
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                                                                         longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            
            locationManager.startMonitorRegion(region: region)
            
            // 4. 創建大頭釘(annotation)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate;
            annotation.title = "\(title)";
            mapView.addAnnotation(annotation)
            
            // 5. 繪製一個圓圈圖形（用於表示 region 的範圍）
            let circle = MKCircle(center: coordinate, radius: regionRadius)
            mapView.add(circle)
            
        }
    }
    
}

