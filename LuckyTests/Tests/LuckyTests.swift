//
//  LuckyTests.swift
//  LuckyTests
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import XCTest
import RxSwift
@testable import Lucky

class LuckyTests: XCTestCase {
    
    let disposeBag: DisposeBag = DisposeBag()
        
    func testHomeFlow() {
        let interactor = HomeInteractor(provider: PromotionsProviderMock())
        let presenter = HomePresenter(wireframe: HomeWireframe(), interactor: interactor)
 
        presenter.getPromotions().subscribe(onSuccess: { (homeData) in
            guard let data = homeData else {
                XCTFail("Get promotions has failed")
                return
            }
        
        XCTAssertTrue(data.title == "offers", "Home Title should be equals to offers")
        XCTAssertFalse(data.sections.count > 0, "Home sections count should be 0")
            
        }, onError: { (error) in
            XCTFail("Get promotions has failed")
        }).disposed(by: disposeBag)
    }
}
