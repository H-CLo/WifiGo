//
//  ViewController_Extension.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 03/10/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation
import MapKit

// MARK : MKMapViewDelegate

extension ViewController : MKMapViewDelegate {
    
    // custom annotation layout
    // https://stackoverflow.com/questions/26991473/mkpointannotations-touch-event-in-swift
    // https://stackoverflow.com/questions/38274115/ios-swift-mapkit-custom-annotation
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        return nil
    }
    
    // custom event when tap annotation
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    
}

extension ViewController : LocationManagerDelegate {
    
    func viewNeedKnowLocationAuthorizationStatus(status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways:
            locationManager.startUpdateLocation()
            
            break
        case .authorizedWhenInUse:
            locationManager.startUpdateLocation()
            
            break
        case .denied:
            showAlert(message: "123", title: "456")
            
            break
        case .notDetermined:
            locationManager.requestAuthorization()
            
            break
        case .restricted:
            showAlert(message: "123", title: "456")
            
            break
        }
    }
    
}
