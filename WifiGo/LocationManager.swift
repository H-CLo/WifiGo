//
//  LocationManager.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 25/09/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation
import MapKit

protocol LocationManagerDelegate : class {
    func viewNeedKnowLocationAuthorizationStatus(status : CLAuthorizationStatus) -> Void
}

private let locationManager_sharedInstance = LocationManager()

final class LocationManager : NSObject {
    
    weak var delegate : LocationManagerDelegate? = nil
    
    let manager = CLLocationManager()
    
    class func sharedInstance() -> LocationManager {
        return locationManager_sharedInstance
    }
    
    func setup() -> Void {
        
        manager.delegate = self
        manager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        requestAuthorization()
    }
    
    func requestAuthorization() -> Void {
        
        func isUserAllowLocation() -> Bool {
            
            if CLLocationManager.locationServicesEnabled() {
                
                return true
            }
            
            return false
        }
        
        if !isUserAllowLocation(){
            manager.requestAlwaysAuthorization()
        }
    }
    
    func startUpdateLocation() -> Void {
        
        manager.startUpdatingLocation()
    }
    
    func startMonitorRegion(region : CLRegion) -> Void {
        
        manager.startMonitoring(for: region)
    }
    
    
    
}

extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        delegate?.viewNeedKnowLocationAuthorizationStatus(status: status)
    }
}
