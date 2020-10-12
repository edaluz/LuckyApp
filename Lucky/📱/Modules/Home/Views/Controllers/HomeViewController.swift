//
//  HomeViewController.swift
//  Grada
//
//  Created by Emiliano Da luz on 06/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var disposeBag: DisposeBag = DisposeBag()
    private var presenter: HomePresenterTestable
    private lazy var dataSource: HomeCollectionViewDataSource = {
        let dataSource = HomeCollectionViewDataSource()
        dataSource.delegate = self
        return dataSource
    }()
    
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private var homeData: HomeModel?
    
    init(with presenter: HomePresenterTestable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        dataSource.collectionView = collectionView
        setupViews()
        getData()
    }
    
    final func setupViews() {
        self.view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
    }
    
    private func getData() {
        activityIndicator.startAnimating()
        presenter.getPromotions().subscribe(onSuccess: { [weak self] (homeData) in
            guard let data = homeData else { return }
            self?.homeData = data
            self?.dataSource.setSections(data.sections)
            self?.setHomeTitle()
            self?.activityIndicator.stopAnimating()
        }, onError: { [weak self] (error) in
            self?.activityIndicator.stopAnimating()
            
            //Show Placeholder
        }).disposed(by: disposeBag)
    }
    
    func setHomeTitle() {
        guard let data = self.homeData else { return }
        self.navigationItem.title = data.title
    }
}

extension HomeViewController: HomeDataSourceDelegate {
    func didSelectItem(promotion: PromotionModel) {
        guard let navigation = self.navigationController else { return }
        presenter.showProductDetails(navigation, url: promotion.detailUrl)
    }
}
