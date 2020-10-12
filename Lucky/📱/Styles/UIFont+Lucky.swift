//
//  UIFont+Lucky.swift
//  Lucky
//
//  Created by Emiliano Da luz on 10/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

public enum LuckyFontBase: CGFloat {
    case h1 = 32
    case h2 = 24
    case headline = 18
    case body = 16
    case captionOne = 14
    case captionTwo = 12
    case label = 10
    case small = 8
}

public struct LuckyFontCore {
    
    // MARK: - H1 font
    public var h1Regular: UIFont {
        return LuckyFontCore.font(.h1, style: .regular)
    }
    
    public var h1SemiBold: UIFont {
        return LuckyFontCore.font(.h1, style: .semiBold)
    }
    
    public var h1Bold: UIFont {
        return LuckyFontCore.font(.h1, style: .bold)
    }
    
    // MARK: - H2 font
    public var h2Regular: UIFont {
        return LuckyFontCore.font(.h2, style: .regular)
    }
    
    public var h2SemiBold: UIFont {
        return LuckyFontCore.font(.h2, style: .semiBold)
    }
    
    public var h2Bold: UIFont {
        return LuckyFontCore.font(.h2, style: .bold)
    }
    
    // MARK: - Headline font
    public var headlineRegular: UIFont {
        return LuckyFontCore.font(.headline, style: .regular)
    }
    
    public var headlineSemiBold: UIFont {
        return LuckyFontCore.font(.headline, style: .semiBold)
    }
    
    public var headlineBold: UIFont {
        return LuckyFontCore.font(.headline, style: .bold)
    }
    
    // MARK: - Body font
    public var bodyRegular: UIFont {
        return LuckyFontCore.font(.body, style: .regular)
    }
    
    public var bodySemiBold: UIFont {
        return LuckyFontCore.font(.body, style: .semiBold)
    }
    
    public var bodyBold: UIFont {
        return LuckyFontCore.font(.body, style: .bold)
    }
    
    // MARK: - Caption One font
    public var captionOneRegular: UIFont {
        return LuckyFontCore.font(.captionOne, style: .regular)
    }
    
    public var captionOneSemiBold: UIFont {
        return LuckyFontCore.font(.captionOne, style: .semiBold)
    }
    
    public var captionOneBold: UIFont {
        return LuckyFontCore.font(.captionOne, style: .bold)
    }
    
    // MARK: - Caption Two font
    public var captionTwoRegular: UIFont {
        return LuckyFontCore.font(.captionTwo, style: .regular)
    }
    
    public var captionTwoSemiBold: UIFont {
        return LuckyFontCore.font(.captionTwo, style: .semiBold)
    }
    
    public var captionTwoBold: UIFont {
        return LuckyFontCore.font(.captionTwo, style: .bold)
    }
    
    // MARK: - Label font
    public var labelRegular: UIFont {
        return LuckyFontCore.font(.label, style: .regular)
    }
    
    public var labelSemiBold: UIFont {
        return LuckyFontCore.font(.label, style: .semiBold)
    }
    
    public var labelBold: UIFont {
        return LuckyFontCore.font(.label, style: .bold)
    }
    
    public var smallSemiBold: UIFont {
        return LuckyFontCore.font(.small, style: .semiBold)
    }
}

public extension LuckyFontCore {
    
    static func font(_ font: LuckyFontBase, style: LuckyFontName) -> UIFont {
        switch style {
        case .regular:
            return UIFont.systemFont(ofSize: font.rawValue, weight: .regular)
        case .semiBold:
            return UIFont.systemFont(ofSize: font.rawValue, weight: .semibold)
        case .bold:
            return UIFont.systemFont(ofSize: font.rawValue, weight: .bold)
        }
    }
}

public enum LuckyFontName: String {
    case regular
    case bold
    case semiBold
}

