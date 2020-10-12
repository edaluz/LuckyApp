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
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.isHidden = true
        }
    }
    
    @IBOutlet weak var brandLabel: UILabel! {
        didSet {
            brandLabel.textColor = LuckyStyles.secondary.gray
            brandLabel.font = LuckyStyles.font.captionTwoRegular
        }
    }
    
    @IBOutlet weak var reviewsImageView: UIImageView! {
        didSet {
            reviewsImageView.image = UIImage.init(named: "ReviewsIcon")
            reviewsImageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBOutlet weak var reviewsLabel: UILabel! {
        didSet {
            reviewsLabel.textColor = LuckyStyles.secondary.gray
            reviewsLabel.font = LuckyStyles.font.captionTwoRegular
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black
            titleLabel.font = LuckyStyles.font.h1Bold
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = LuckyStyles.secondary.content
            descriptionLabel.font = LuckyStyles.font.bodyRegular
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.textColor = LuckyStyles.secondary.content
            priceLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    @IBOutlet weak var oldPriceLabel: UILabel! {
        didSet {
            oldPriceLabel.textColor = LuckyStyles.secondary.gray
            oldPriceLabel.font = LuckyStyles.font.captionOneRegular
        }
    }
    
    @IBOutlet weak var newPriceLabel: UILabel! {
        didSet {
            newPriceLabel.textColor = LuckyStyles.secondary.content
            newPriceLabel.font = LuckyStyles.font.headlineRegular
        }
    }
    
    @IBOutlet weak var expireLabel: UILabel! {
        didSet {
            expireLabel.textColor = LuckyStyles.secondary.gray
            expireLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    @IBOutlet weak var redemptionsLabel: UILabel! {
        didSet {
            redemptionsLabel.textColor = LuckyStyles.secondary.content
            redemptionsLabel.font = LuckyStyles.font.captionTwoRegular
        }
    }
    
    
    private var disposeBag: DisposeBag = DisposeBag()
    private var presenter: ProductDetailsPresenterTestable
    private var info: ProductDetailsModel?
    
    init(with presenter: ProductDetailsPresenterTestable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductDetails()
    }
    
    
    private func getProductDetails() {
        presenter.getProductDetails().subscribe(onSuccess: { [weak self] (productInfo) in
            guard let info = productInfo else { return }
            self?.info = info
            self?.setProductInfo()
        }, onError: { (error) in
            //Error
            
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
