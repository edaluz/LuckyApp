//
//  HomeCollectionViewCell.swift
//  Lucky
//
//  Created by Emiliano Da luz on 07/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var productImageView: UIImageView! {
        didSet {
            productImageView.layer.cornerRadius = 2
            productImageView.clipsToBounds = true
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
            reviewsLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    @IBOutlet private weak var brandLabel: UILabel! {
        didSet {
            brandLabel.textColor = LuckyStyles.secondary.gray
            brandLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black
            titleLabel.font = LuckyStyles.font.bodyBold
        }
    }
    
    @IBOutlet private weak var tagsLabel: UILabel! {
        didSet {
            tagsLabel.textColor = LuckyStyles.secondary.gray
            tagsLabel.font = LuckyStyles.font.labelRegular
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ promotion: PromotionModel) {
        setPromotionImage(imageURL: promotion.imageUrl)
        brandLabel.text = promotion.brand.uppercased()
        titleLabel.text = promotion.title
        tagsLabel.text = promotion.tags ?? LanguageString.discount
        reviewsLabel.text = "\(promotion.favoriteCount.description)K"
    }
    
    func setPromotionImage(imageURL: String) {
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        productImageView.image = UIImage(data: data!)
    }
}
