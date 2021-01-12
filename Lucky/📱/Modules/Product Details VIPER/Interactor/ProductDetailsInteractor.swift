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
}

class ProductDetailsInteractor: ProductDetailsInteractorTestable {
    private var provider: ProductsProvider = ProductsProvider()
    
    func getProductDetails(_ detailURL: String) -> Single<ProductDetailsModel?> {
        return provider.getProductDetails(detailURL)
    }
}
