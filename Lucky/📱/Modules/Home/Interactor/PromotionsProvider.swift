//
//  PromotionsProvider.swift
//  Lucky
//
//  Created by Emiliano Da luz on 08/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

protocol PromotionsProviderProtocol {
    func getPromotions() -> Single<HomeModel?>
}

class PromotionsProvider: PromotionsProviderProtocol {
    private let disposeBag = DisposeBag()
        
    func getPromotions() -> Single<HomeModel?> {
        return Single.create { [weak self] single in
            RxAlamofire.requestJSON(.get, ServiceDefinitions.homeURL)
                            .debug()
                            .subscribe(onNext: { (r, json) in
                                if let dict = json as? [String: Any],
                                   let jsonData = try? JSONSerialization.data(withJSONObject: dict),
                                   let homeData: HomeModel = try? JSONDecoder().decode(HomeModel.self, from: jsonData) {
                                    single(.success(homeData))
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


class ServiceDefinitions {
    static let homeURL = "https://www.nasable.com/luckytest/api/offers/"
}
