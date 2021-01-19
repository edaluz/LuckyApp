//
//  ProductDetailsInteractor.swift
//  Lucky
//
//  Created by Emiliano Da luz on 11/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import RxSwift

protocol ProductDetailsInteractorTestable {
    func getProductDetails(_ detailURL: String) -> Single<ProductDetailsModel?>
    func getBranches(_ detailURL: String) -> Single<ProductDetailsModel?>
    func getCategories(_ detailURL: String) -> Single<ProductDetailsModel?>
}

class ProductDetailsInteractor: ProductDetailsInteractorTestable {
    private var provider: ProductsProvider = ProductsProvider()
    
    func getProductDetails(_ detailURL: String) -> Single<ProductDetailsModel?> {
        return provider.getProductDetails(detailURL)
    }
    
    func getBranches(_ detailURL: String) -> Single<ProductDetailsModel?> {
        return provider.getBranches(detailURL)
    }
    
    func getCategories(_ detailURL: String) -> Single<ProductDetailsModel?> {
        let isHotDealOfffer: Bool = detailURL.isEmpty
        
        if isHotDealOfffer {
            return provider.getBranches(detailURL)
        }
        
        return provider.getCategories(detailURL)
    }
     
}
