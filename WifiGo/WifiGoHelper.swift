//
//  WifiGoHelper.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 25/09/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation
import Alamofire

private let wifiGoHelper_sharedInstance = WifiGoHelper()

final class WifiGoHelper {
    
    class func sharedInstance() -> WifiGoHelper {
        return wifiGoHelper_sharedInstance
    }
    
    func getWifiData() -> Void {
        
        Alamofire.request("http://www.gsp.gov.tw/iTaiwan/itw_tw.json").responseJSON {
            response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
            
            
        }
        
    }
    
}
