//
//  FreeWifi.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 01/10/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation

class FreeWifi {
    
    var siteID : String?
    var agency : String?
    var name : String?
    var address : String?
    var latitude : String?
    var longtitude : String?
    
    init(siteId : String?, agency : String?, name : String?, address: String?, latitude : String?, longtitude : String?) {
        
        self.siteID = siteId
        self.agency = agency
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longtitude = longtitude
    }
}
