//
//  HomeModule.swift
//  Grada
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import UIKit

class HomeModule {
    private let presenter: HomePresenterTestable
    private let wireframe: HomeWireframeTestable
    private let interactor: HomeInteractorTestable
    
    init() {
        self.wireframe = HomeWireframe()
        self.interactor = HomeInteractor()
        self.presenter = HomePresenter(wireframe: self.wireframe, interactor: self.interactor)
    }
    
    func showHome(navigation: UINavigationController) {
        presenter.showHome(navigation: navigation)
    }
}
