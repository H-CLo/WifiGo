//
//  APIManager.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 02/10/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private let apiManager_sharedInstance = APIManager()

final class APIManager {
    
    // Free wifi API from government
    let API : String = "http://www.gsp.gov.tw/iTaiwan/itw_tw.json"
    
    var freeWifiDict : [FreeWifi] = []
    
    class func sharedInstance() -> APIManager {
        return apiManager_sharedInstance
    }
    
    // MARK : request Free Wifi INFO
    
    func requestFreeWifiInfo(nextTask : @escaping (_ success : Bool) -> Void ) -> Void {
        
        //let data = Cacher(destination: Cacher.CacheDestination.atFolder(""))
        
        
        
        Alamofire.request(API).responseJSON {
            response in
            
            if response.result.isFailure {
                NSLog("Request error, \(String(describing: response.error))")
                
                nextTask(false)
            }
            
            if let jsonData = response.data {
                
                let json = JSON(data: jsonData)
                
                self.prepareFreeWifiData(json: json) {
                    Void in
                    
                    nextTask(true)
                }
            }
        }
    }
    
    // MARK : Prepare Free Wifi data
    
    func prepareFreeWifiData(json : JSON, nextTask : () -> Void) -> Void {
        
        for (_, value) in json.enumerated()
        {
            let siteId     = value.1[FreeWifiKey.SITE_ID].stringValue
            let agency     = value.1[FreeWifiKey.AGENCY].stringValue
            let name       = value.1[FreeWifiKey.NAME].stringValue
            let address    = value.1[FreeWifiKey.ADDR].stringValue
            let latitude   = value.1[FreeWifiKey.LATITUDE].stringValue
            let longtitude = value.1[FreeWifiKey.LONGITUDE].stringValue
            
            let freeWifi = FreeWifi(siteId: siteId, agency: agency, name: name, address: address, latitude: latitude, longtitude: longtitude)
            
            if !isInfoExist(info: freeWifi) {
                
                freeWifiDict.append(freeWifi)
            }
            
        }
        
        nextTask()
    }
    
    private func isInfoExist(info : FreeWifi) -> Bool {
        
        for (_, value) in freeWifiDict.enumerated()
        {
            if let id = value.siteID, let id2 = info.siteID {
                
                if id == id2 {
                    
                    return true
                }
            }
            
        }
        
        return false
        
    }
    
}
