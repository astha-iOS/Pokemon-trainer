//
//  CommanClass.swift
//  Wefox
//
//  Created by Astha yadav on 12/10/21.
//

import Foundation
import UIKit

extension String{
    
    func loadImage()-> UIImage{
        
        do {
            guard let url = URL(string: self) else{
                return UIImage()
            }
            //convert URL to Data
            let data:Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        }catch{
            
        }
        
        return UIImage()
    }
}


struct NavigationUtil {
  static func popToRootView() {
    findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
      .popToRootViewController(animated: true)
  }

  static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
    guard let viewController = viewController else {
      return nil
    }

    if let navigationController = viewController as? UINavigationController {
      return navigationController
    }

    for childViewController in viewController.children {
      return findNavigationController(viewController: childViewController)
    }

    return nil
  }
}
