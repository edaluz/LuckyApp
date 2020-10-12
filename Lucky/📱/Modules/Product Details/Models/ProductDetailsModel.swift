//
//  ProductDetailsModel.swift
//  Lucky
//
//  Created by Emiliano Da luz on 11/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import  UIKit

struct ProductDetailsModel: Codable {
    let id: Int
    let imageUrl: String
    let brand: String
    let title: String
    let tags: String?
    let favoriteCount: Int
    let description: String
    let prices: ProductPrices
    let expiration: String
    let redemptionsCap: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl
        case brand
        case title
        case tags
        case favoriteCount
        case description
        case prices = "price"
        case expiration
        case redemptionsCap
    }
}

struct ProductPrices: Codable {
    let old: String
    let new: String
    
    enum CodingKeys: String, CodingKey {
        case old
        case new
    }
}
