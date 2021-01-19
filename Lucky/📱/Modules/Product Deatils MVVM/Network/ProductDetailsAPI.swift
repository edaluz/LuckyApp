//
//  ProductDetailsAPI.swift
//  Lucky
//
//  Created by Emiliano Da Luz on 12/01/2021.
//  Copyright © 2021 MEK. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class ProductDetailsAPI: ProductsProviderProtocol {
    private let disposeBag = DisposeBag()
        
    func getProductDetails(_ detailURL: String) -> Single<ProductDetailsModel?> {
        return Single.create { [weak self] single in
            RxAlamofire.requestJSON(.get, detailURL)
                            .debug()
                            .subscribe(onNext: { (r, json) in
                                if let dict = json as? [String: Any],
                                   let jsonData = try? JSONSerialization.data(withJSONObject: dict),
                                   let productData: ProductDetailsModel = try? JSONDecoder().decode(ProductDetailsModel.self, from: jsonData) {
                                    single(.success(productData))
                                }
                                
                                single(.success(nil))
                                }, onError: { (error) in
                                    single(.error(error))
                            })
                .disposed(by: self?.disposeBag ?? DisposeBag())

            return Disposables.create()
        }
    }
    
    func getBranches(_ detailURL: String) -> Single<ProductDetailsModel?> {
        return Single.create { [weak self] single in
            RxAlamofire.requestJSON(.get, detailURL)
                            .debug()
                            .subscribe(onNext: { (r, json) in
                                if let dict = json as? [String: Any],
                                   let jsonData = try? JSONSerialization.data(withJSONObject: dict),
                                   let productData: ProductDetailsModel = try? JSONDecoder().decode(ProductDetailsModel.self, from: jsonData) {
                                    single(.success(productData))
                                }
                                
                                single(.success(nil))
                                }, onError: { (error) in
                                    single(.error(error))
                            })
                .disposed(by: self?.disposeBag ?? DisposeBag())

            return Disposables.create()
        }
    }
    
    func getCategories(_ detailURL: String) -> Single<ProductDetailsModel?> {
        return Single.create { [weak self] single in
            RxAlamofire.requestJSON(.get, detailURL)
                            .debug()
                            .subscribe(onNext: { (r, json) in
                                if let dict = json as? [String: Any],
                                   let jsonData = try? JSONSerialization.data(withJSONObject: dict),
                                   let productData: ProductDetailsModel = try? JSONDecoder().decode(ProductDetailsModel.self, from: jsonData) {
                                    single(.success(productData))
                                }
                                
                                single(.success(nil))
                                }, onError: { (error) in
                                    single(.error(error))
                            })
                .disposed(by: self?.disposeBag ?? DisposeBag())

            return Disposables.create()
        }
    }
}
