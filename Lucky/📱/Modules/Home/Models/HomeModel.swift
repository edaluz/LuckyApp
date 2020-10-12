//
//  HomeModel.swift
//  Lucky
//
//  Created by Emiliano Da luz on 08/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import  UIKit

struct HomeModel: Codable {
    let title: String
    let sections: [HomeSectionModel]
    
    enum CodingKeys: String, CodingKey {
        case title
        case sections
    }
}

struct HomeSectionModel: Codable {
    let title: String
    let promotions: [PromotionModel]
    
    enum CodingKeys: String, CodingKey {
        case title
        case promotions = "items"
    }
}

struct PromotionModel: Codable {
    let detailUrl: String
    let imageUrl: String
    let brand: String
    let title: String
    let tags: String?
    let favoriteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case detailUrl
        case imageUrl
        case brand
        case title
        case tags
        case favoriteCount
    }
}
