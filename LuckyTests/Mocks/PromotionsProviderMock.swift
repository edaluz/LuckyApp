//
//  PromotionsProviderMock.swift
//  LuckyTests
//
//  Created by Emiliano Da luz on 12/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import RxSwift
@testable import Lucky

class PromotionsProviderMock: PromotionsProviderProtocol {
    private let disposeBag = DisposeBag()
        
    func getPromotions() -> Single<HomeModel?> {
        let homeData = HomeModel(title: "offers", sections: [])
        return .just(homeData)
    }
}
