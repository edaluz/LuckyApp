//
//  AppDelegate+Setup.swift
//  Lucky
//
//  Created by Emiliano Da luz on 07/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    func setupRootController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        
        HomeModule().showHome(navigation: navigationController)
    }
    
}
