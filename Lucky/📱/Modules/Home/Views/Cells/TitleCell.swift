//
//  TitleCell.swift
//  Lucky
//
//  Created by Emiliano Da luz on 10/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

class TitleCell: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black
            titleLabel.font = LuckyStyles.font.h2Regular
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setHeaderTitle(_ title: String) {
        titleLabel.text = title
    }
}
