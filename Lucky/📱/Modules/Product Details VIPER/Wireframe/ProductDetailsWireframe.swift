//
//  ProductDetailsWireframe.swift
//  Lucky
//
//  Created by Emiliano Da luz on 10/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailsWireframeTestable {
    func showProductDetails(navigation: UINavigationController, presenter: ProductDetailsPresenterTestable)
    
    //Extra material to increase the size of the component
    func showCategories(navigation: UINavigationController, presenter: ProductDetailsPresenterTestable)
    func showBranches(navigation: UINavigationController)
}

class ProductDetailsWireframe: ProductDetailsWireframeTestable {
    func showProductDetails(navigation: UINavigationController, presenter: ProductDetailsPresenterTestable) {
        let productVC = ProductDetailsViewController(with: presenter)
        navigation.pushViewController(productVC, animated: true)
    }
    
    //should show categories
    func showCategories(navigation: UINavigationController, presenter: ProductDetailsPresenterTestable) {
        let productVC = ProductDetailsViewController(with: presenter)
        navigation.pushViewController(productVC, animated: true)
    }
    
    //should show branches
    func showBranches(navigation: UINavigationController) {
        //should show branches
    }
}
