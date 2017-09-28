//
//  LocationManager.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 25/09/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation
import MapKit

private let locationManager_sharedInstance = LocationManager()

final class LocationManager : NSObject {
    
    let manager = CLLocationManager()
    
    class func sharedInstance() -> LocationManager {
        return locationManager_sharedInstance
    }
    
    func isUserAllowLocation() -> Bool {
        
        manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            return true
        }
        
        return false
    }
    
    func startUpdateLocation() -> Void {
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        
    }
    
}

extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
