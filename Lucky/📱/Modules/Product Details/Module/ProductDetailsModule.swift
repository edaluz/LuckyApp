//
//  ProductDetailsModule.swift
//  Lucky
//
//  Created by Emiliano Da luz on 10/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsModule {
    private let presenter: ProductDetailsPresenterTestable
    private let wireframe: ProductDetailsWireframeTestable
    private let interactor: ProductDetailsInteractorTestable
    
    init() {
        self.wireframe = ProductDetailsWireframe()
        self.interactor = ProductDetailsInteractor()
        self.presenter = ProductDetailsPresenter(wireframe: self.wireframe, interactor: self.interactor)
    }
    
    func showProductDetails(navigation: UINavigationController, productDetailURL: String) {
        presenter.showProductDetails(navigation: navigation, productDetailURL: productDetailURL)
    }
}
