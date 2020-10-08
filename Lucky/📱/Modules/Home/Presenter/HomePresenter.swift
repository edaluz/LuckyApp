//
//  HomePresenter.swift
//  Grada
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import UIKit

protocol HomePresenterTestable {
    var wireframe: HomeWireframeTestable { get }
    var interactor: HomeInteractorTestable { get }
    func showHome(navigation: UINavigationController)
}

class HomePresenter: HomePresenterTestable {
    var wireframe: HomeWireframeTestable
    var interactor: HomeInteractorTestable
    
    init(wireframe: HomeWireframeTestable, interactor: HomeInteractorTestable) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func showHome(navigation: UINavigationController) {
        wireframe.showHome(navigation: navigation, presenter: self)
    }
}
