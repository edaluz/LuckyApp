//
//  HomeInteractor.swift
//  Grada
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeInteractorTestable {
    func getPromotions() -> Single<HomeModel?>
}

class HomeInteractor: HomeInteractorTestable {
    private var provider: PromotionsProviderProtocol
    
    init(provider: PromotionsProviderProtocol = PromotionsProvider()) {
        self.provider = provider
    }
    
    func getPromotions() -> Single<HomeModel?> {
        return provider.getPromotions()
    }
}
