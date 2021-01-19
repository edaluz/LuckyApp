//
//  ProductDetailsViewModel.swift
//  Lucky
//
//  Created by Emiliano Da Luz on 12/01/2021.
//  Copyright © 2021 MEK. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol ProductDetailsViewModelTestable {
    func showProductDetails(navigation: UINavigationController, productDetailURL: String)
    func getProductDetails() -> Single<ProductDetailsModel?>
    
    //Extra material
    func showBranches(navigation: UINavigationController)
    func showCategories(navigation: UINavigationController)
    func trackShowProductDetails()
    func trackButtonTapped() 
}

class ProductDetailsViewModel: NSObject, ProductDetailsViewModelTestable {
    private var detailURL: String?
    
    func showProductDetails(navigation: UINavigationController, productDetailURL: String) {
        self.detailURL = productDetailURL
        let productVC = ProductDetailsViewController(with: nil)
        navigation.pushViewController(productVC, animated: true)
    }
    
    func getProductDetails() -> Single<ProductDetailsModel?> {
        guard let url = detailURL else { return .just(nil) }
        return ProductDetailsAPI().getProductDetails(url)
    }
    
    
    //Extra functions to increase the size of the component
    func getBranches() -> Single<ProductDetailsModel?> {
        guard let url = detailURL else { return .just(nil) }
        return ProductDetailsAPI().getBranches(url)
    }
    
    func getCategories() -> Single<ProductDetailsModel?> {
        guard let url = detailURL else { return .just(nil) }
        
        let isHotDealOfffer: Bool = (detailURL != nil) ? true : false
        
        if isHotDealOfffer {
            return ProductDetailsAPI().getBranches(url)
        }
        
        return ProductDetailsAPI().getCategories(url)
    }
    
    func showBranches(navigation: UINavigationController) {
        //Should show branches for the current offer
        let isHotDealOfffer: Bool = (detailURL != nil) ? true : false
        
        if isHotDealOfffer {
            let productVC = ProductDetailsViewController(with: nil)
            navigation.pushViewController(productVC, animated: true)
        } else {
            let productVC = ProductDetailsViewController(with: nil)
            navigation.pushViewController(productVC, animated: true)
        }
    }
    
    func showCategories(navigation: UINavigationController) {
        //Should show Categories for the current offer
        let productVC = ProductDetailsViewController(with: nil)
        navigation.pushViewController(productVC, animated: true)
    }
    
    func trackShowProductDetails() {
        //Track Analytics
    }
    
    func trackButtonTapped() {
        //Track Analytics
    }
}
