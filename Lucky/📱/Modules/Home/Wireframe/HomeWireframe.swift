//
//  HomeWireframe.swift
//  Grada
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import UIKit

protocol HomeWireframeTestable {
    func showHome(navigation: UINavigationController, presenter: HomePresenterTestable)
}

class HomeWireframe: HomeWireframeTestable {
    
    func showHome(navigation: UINavigationController, presenter: HomePresenterTestable) {
        let homeVC = HomeViewController(with: presenter)
        navigation.setViewControllers([homeVC], animated: false)
    }
}
