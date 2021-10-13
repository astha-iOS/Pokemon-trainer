//
//  AlertService.swift
//  ChatExample
//
//  Created by Mohannad on 12/25/20.
//  Copyright © 2020 MessageKit. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    static var sharedInstance:Alert {
        let instance = Alert()
        return instance
    }
    
    func showAlert(message:String,viewcontoller:UIViewController? = nil) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let alert = UIAlertController(title: "ALERT", message: message,preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            if let vc = viewcontoller {
                vc.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    

}


