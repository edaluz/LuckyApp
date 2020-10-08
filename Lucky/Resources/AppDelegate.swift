//
//  AppDelegate.swift
//  Lucky
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let viewController = UIViewController()
        viewController.view.frame = UIScreen.main.bounds
        viewController.view.backgroundColor = .blue
        window?.rootViewController = UINavigationController(rootViewController: viewController)

        return true
    }
}

