//
//  ProductDetailsViewController.swift
//  Lucky
//
//  Created by Emiliano Da luz on 10/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ProductDetailsViewController: UIViewController {
    @IBOutlet private weak var productImageView: UIImageView!
    
    @IBOutlet private weak var errorLabel: UILabel! {
        didSet {
            errorLabel.textColor = LuckyStyles.secondary.content
            errorLabel.font = LuckyStyles.font.h1Bold
            errorLabel.text = LanguageString.errorPlaceholder
            errorLabel.isHidden = true
        }
    }
    
    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            scrollView.isHidden = true
        }
    }
    
    @IBOutlet private weak var brandLabel: UILabel! {
        didSet {
            brandLabel.textColor = LuckyStyles.secondary.gray
            brandLabel.font = LuckyStyles.font.captionTwoRegular
        }
    }
    
    @IBOutlet private weak var reviewsImageView: UIImageView! {
        didSet {
            reviewsImageView.image = UIImage.init(named: "ReviewsIcon")
            reviewsImageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet private weak var reviewsLabel: UILabel! {
        didSet {
            reviewsLabel.textColor = LuckyStyles.secondary.gray
            reviewsLabel.font = LuckyStyles.font.captionTwoRegular
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black
            titleLabel.font = LuckyStyles.font.h1Bold
        }
    }
    
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = LuckyStyles.secondary.content
            descriptionLabel.font = LuckyStyles.font.bodyRegular
        }
    }
    
    @IBOutlet private weak var priceLabel: UILabel! {
        didSet {
            priceLabel.textColor = LuckyStyles.secondary.content
            priceLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    @IBOutlet private weak var oldPriceLabel: UILabel! {
        didSet {
            oldPriceLabel.textColor = LuckyStyles.secondary.gray
            oldPriceLabel.font = LuckyStyles.font.captionOneRegular
        }
    }
    
    @IBOutlet private weak var newPriceLabel: UILabel! {
        didSet {
            newPriceLabel.textColor = LuckyStyles.secondary.content
            newPriceLabel.font = LuckyStyles.font.headlineRegular
        }
    }
    
    @IBOutlet private weak var expireLabel: UILabel! {
        didSet {
            expireLabel.textColor = LuckyStyles.secondary.gray
            expireLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    @IBOutlet private weak var redemptionsLabel: UILabel! {
        didSet {
            redemptionsLabel.textColor = LuckyStyles.secondary.content
            redemptionsLabel.font = LuckyStyles.font.captionTwoRegular
        }
    }
    
    private var disposeBag: DisposeBag = DisposeBag()
    private var presenter: ProductDetailsPresenterTestable
    private var info: ProductDetailsModel?
    
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    init(with presenter: ProductDetailsPresenterTestable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getProductDetails()
    }
    
    final func setupViews() {
        self.view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
    }
    
    private func getProductDetails() {
        activityIndicator.startAnimating()
        presenter.getProductDetails().subscribe(onSuccess: { [weak self] (productInfo) in
            guard let info = productInfo else { return }
            self?.info = info
            self?.setProductInfo()
            self?.activityIndicator.stopAnimating()            
        }, onError: { [weak self] (error) in
            self?.activityIndicator.stopAnimating()
            self?.errorLabel.isHidden = false
        }).disposed(by: disposeBag)
    }
    
    private func setProductInfo() {
        guard let info = info else { return }
        setPromotionImage(imageURL: info.imageUrl)
        brandLabel.text = info.brand.uppercased()
        titleLabel.text = info.title
        descriptionLabel.text = info.description
        reviewsLabel.text = "\(info.favoriteCount.description)K"
        priceLabel.text = LanguageString.price.uppercased()
        expireLabel.text = info.expiration
        
        //attribute string for Old Price Label
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: info.prices.old)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

        oldPriceLabel.attributedText = attributeString
        
        
        newPriceLabel.text = info.prices.new
        redemptionsLabel.text = "\(LanguageString.redemptionsTitle) \(info.redemptionsCap.uppercased())"
        
        self.scrollView.isHidden = false
    }
    
    func setPromotionImage(imageURL: String) {
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        productImageView.image = UIImage(data: data!)
    }
}
