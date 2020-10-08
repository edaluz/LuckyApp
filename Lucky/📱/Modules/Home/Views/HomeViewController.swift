//
//  HomeViewController.swift
//  Grada
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var presenter: HomePresenterTestable
      
    init(with presenter: HomePresenterTestable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

    }
}
