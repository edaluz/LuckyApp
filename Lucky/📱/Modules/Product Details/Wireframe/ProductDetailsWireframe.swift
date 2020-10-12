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
}

class ProductDetailsWireframe: ProductDetailsWireframeTestable {
    func showProductDetails(navigation: UINavigationController, presenter: ProductDetailsPresenterTestable) {
        let productVC = ProductDetailsViewController(with: presenter)
        navigation.pushViewController(productVC, animated: true)
    }
}
