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
}
