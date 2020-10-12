//
//  LanguageKey.swift
//  Lucky
//
//  Created by Emiliano Da luz on 11/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation

enum LanguageKey: String {
    //Home
    case discount
    
    //Product Details
    case price
    case redemptionsTitle
    
    //Error
    case errorPlaceholder
    case homeError
    
    func localize() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

