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
    
    //Extra material
    func getBranches() -> Single<ProductDetailsModel?>
    func getCategories() -> Single<ProductDetailsModel?>
    func showBranches(navigation: UINavigationController)
    func showCategories(navigation: UINavigationController)
    func trackShowProductDetails()
    func trackButtonTapped() 
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
    
    //Extra functions to increase the size of the component
    func getCategories() -> Single<ProductDetailsModel?> {
        guard let url = detailURL else { return .just(nil) }
        
        return interactor.getProductDetails(url)
    }
    
    func getBranches() -> Single<ProductDetailsModel?> {
        guard let url = detailURL else { return .just(nil) }
        
        return interactor.getProductDetails(url)
    }
    
    func showBranches(navigation: UINavigationController) {
        //Should show branches for the current offer
        let isHotDealOfffer: Bool = (detailURL != nil) ? true : false
        
        if isHotDealOfffer {
            wireframe.showBranches(navigation: navigation)
        } else {
            wireframe.showCategories(navigation: navigation, presenter: self)
        }
    }
    
    func showCategories(navigation: UINavigationController) {
        //Should show Categories for the current offer
        wireframe.showProductDetails(navigation: navigation, presenter: self)
    }
    
    func trackShowProductDetails() {
        //Track Analytics
    }
    
    func trackButtonTapped() {
        //Track Analytics
    }
    
    
}
