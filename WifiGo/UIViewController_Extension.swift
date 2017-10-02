//
//  UIViewController_Extension.swift
//  WifiGo
//
//  Created by Hung Chang Lo on 03/10/2017.
//  Copyright © 2017 Hung Chang Lo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
