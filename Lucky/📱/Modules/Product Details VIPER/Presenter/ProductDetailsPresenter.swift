//
//  ProductDetailsPresenter.swift
//  Lucky
//
//  Created by Emiliano Da luz on 10/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol ProductDetailsPresenterTestable {
    var wireframe: ProductDetailsWireframeTestable { get }
    var interactor: ProductDetailsInteractorTestable { get }
    func showProductDetails(navigation: UINavigationController, productDetailURL: String)
    func getProductDetails() -> Single<ProductDetailsModel?>
}

class ProductDetailsPresenter: ProductDetailsPresenterTestable {
    var wireframe: ProductDetailsWireframeTestable
    var interactor: ProductDetailsInteractorTestable
    private var detailURL: String?
    
    init(wireframe: ProductDetailsWireframeTestable, interactor: ProductDetailsInteractorTestable) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func showProductDetails(navigation: UINavigationController, productDetailURL: String) {
        self.detailURL = productDetailURL
        wireframe.showProductDetails(navigation: navigation, presenter: self)
    }
    
    func getProductDetails() -> Single<ProductDetailsModel?> {
        guard let url = detailURL else { return .just(nil) }
        
        return interactor.getProductDetails(url)
    }
}
