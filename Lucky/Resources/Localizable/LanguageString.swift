//
//  LanguageString.swift
//  Lucky
//
//  Created by Emiliano Da luz on 11/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation

class LanguageString: NSObject {
    //Home
    static var discount: String { return LanguageKey.discount.localize() }
    
    //Product Details
    static var price: String { return LanguageKey.price.localize() }
    static var redemptionsTitle: String { return LanguageKey.redemptionsTitle.localize() }
    
    //Error
    static var errorPlaceholder: String { return LanguageKey.errorPlaceholder.localize() }
    static var homeError: String { return LanguageKey.homeError.localize() }
}
